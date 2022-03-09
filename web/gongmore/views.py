from django.shortcuts import render
from .models import Gongmore
from rest_framework import viewsets
from .serializers import GongmoreSerializers

# Create your views here.
def index(requests):
    gongmores = Gongmore.objects.all().order_by('date')
    return render(requests, "index.html", {"gongmores":gongmores})

class GongmoreViewSet(viewsets.ModelViewSet):
    queryset = Gongmore.objects.all().order_by('date')
    serializer_class = GongmoreSerializers