from django.shortcuts import render
from .models import Gongmore
# Create your views here.
def index(requests):
    gongmores = Gongmore.objects.all().order_by('date')
    return render(requests, "index.html", {"gongmores":gongmores})
