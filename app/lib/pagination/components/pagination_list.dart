import 'package:app/pagination/models/pagination_model.dart';
import 'package:app/pagination/providers/pagination_provider.dart';
import 'package:app/pagination/utils/paginate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef PaginationWidgetBuilder<T extends ModelWithId> = Widget Function(
    BuildContext context, int index, T model);

class PaginationList<T extends ModelWithId> extends ConsumerStatefulWidget {
  final StateNotifierProvider<PaginationProvider, PaginationBase> provider;
  final PaginationWidgetBuilder<T> itemBuilder;

  const PaginationList({
    required this.provider,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PaginationList> createState() => _PaginationListState<T>();
}

class _PaginationListState<T extends ModelWithId>
    extends ConsumerState<PaginationList> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  void listener() {
    Paginate.paginate(
      controller: controller,
      provider: ref.read(widget.provider.notifier),
    );
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);
    if (state is PaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is PaginationError) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(
                    widget.provider.notifier,
                  )
                  .paginate(
                    forceRefetch: true,
                  );
            },
            child: const Text('다시시도'),
          ),
        ],
      );
    }

    final paginate = state as Pagination<T>;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RefreshIndicator(
        onRefresh: () async {
          ref.read(widget.provider.notifier).paginate(
                forceRefetch: true,
              );
        },
        child: ListView.separated(
          itemBuilder: (_, index) {
            if (index == paginate.data.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Center(
                  child: paginate is PaginationFetchingMore
                      ? const CircularProgressIndicator()
                      : const Text(
                          '마지막 데이터입니다',
                        ),
                ),
              );
            }
            final pItem = paginate.data[index];

            return widget.itemBuilder(
              context,
              index,
              pItem,
            );
          },
          separatorBuilder: (_, index) {
            return SizedBox(height: 16.0);
          },
          itemCount: paginate.data.length + 1,
        ),
      ),
    );
  }
}
