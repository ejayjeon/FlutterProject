/** 이 모델을 implement 하는 모든 클래스들은 기본적으로 id 값을 들고 있게 하기 위해서 설계함 
 * Pagination을 할 모델들에 이 IModelWithId 클래스를 implement함
 * 
*/
abstract class IModelWithId {
  final String id;

  IModelWithId({
    required this.id,
  });
}
