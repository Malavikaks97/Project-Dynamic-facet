"""dynamicfacet URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url,patterns
from django.contrib import admin
from dynamic.views import *
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
admin.autodiscover()

urlpatterns = [
	url(r'^$',TemplateView.as_view(template_name ='index.html')),
	url(r'^userlogin/',TemplateView.as_view(template_name ='userlogin.html')),
	url(r'^userreg/',TemplateView.as_view(template_name ='userreg.html')),
	url(r'^home/',TemplateView.as_view(template_name ='index.html')),
	#url(r'^contact/$',contact,name='contact'),
	url(r'^contactload/$',contactload,name='contactload'),
	url(r'^admin/', include(admin.site.urls)),
	url(r'^adminhome/$',adminhome,name='adminhome'),
	url(r'^userhomes/$',userhomes,name='userhomes'),
	url(r'^cat/$',catload,name='catload'),
	url(r'^category/$',cataction,name='cataction'),
	url(r'^br/$',brandload,name='brandload'),
	url(r'^brand/$',brandaction,name='brandaction'),
	url(r'^it/$',itemload,name='itemload'),
	url(r'^item/$',itemaction,name='itemaction'),
	url(r'^viewcat/$',viewcategory,name='viewcategory'),
	url(r'^deleteaction/$',deleteaction,name='deleteaction'),
	url(r'^deleteaction1/$',deleteaction1,name='deleteaction1'),
	url(r'^deleteaction2/$',deleteaction2,name='deleteaction2'),
	url(r'^viewbrand/$',viewbrand,name='viewbrand'),
	url(r'^viewitem/$',viewitem,name='viewitem'),
	url(r'^viewitem1/$',viewitem1,name='viewitem1'),
	url(r'^userload/$',userload,name='userload'),
	url(r'^useraction/$',useraction,name='useraction'),
	url(r'^login/$',loginload,name='loginload'),
	url(r'^searchload/$',searchload,name='searchload'),
	url(r'^adminload/$',adminload,name='adminload'),
	url(r'^uload/$',uload,name='uload'),
	url(r'^searchlogin/$',searchlogin,name='searchlogin'),
	url(r'^order/$',orderload,name='orderload'),
	url(r'^orderaction/$',orderaction,name='orderaction'),
	url(r'^feature/$',featureload,name='featureload'),
	url(r'^featureaction/$',featureaction,name='featureaction'),
	url(r'^deleteaction3/$',deleteaction3,name='deleteaction3'),
	url(r'^paymentload/$',paymentload,name='paymentload'),
	url(r'^paymentaction/$',paymentaction,name='paymentaction'),
	url(r'^bankingaction/$',bankingaction,name='bankingaction'),
	url(r'^bankingload/$',bankingload,name='bankingload'),
	url(r'^vieworder/$',vieworder,name='vieworder'),
	url(r'^cart/$',cart,name='cart'),
	url(r'^viewcart/$',viewcart,name='viewcart'),
	url(r'^deletecart/$',deletecart,name='deletecart'),
	url(r'^viewitemsearch/$',viewitemsearch,name='viewitemsearch'),
	url(r'^viewfacet/$',viewfacet,name='viewfacet'),
	url(r'^deletefacet/$',deletefacet,name='deletefacet'),
	url(r'^viewitemsearchadmin/$',viewitemsearchadmin,name='viewitemsearchadmin'),
	url(r'^product_view/$',product_view,name='product_view'),
	url(r'^product_view_user/$',product_view_user,name='product_view_user'),
	url(r'^logout/$',logout,name='logout'),
	url(r'^category_product_view/$',category_product_view,name='category_product_view'),
	url(r'^cat_brand__product_view/$',cat_brand__product_view,name='cat_brand__product_view'),
	url(r'^dynamicfacetsearch/$',dynamicfacetsearch,name='dynamicfacetsearch'),
	url(r'^dynsearch/$',dynsearch,name='dynsearch'),
	url(r'^viewitemall/$',viewitemall,name='viewitemall'),
	url(r'^filter/$',filter,name='filter'),
	url(r'^filterdelete/$',filterdelete,name='filterdelete'),
	url(r'^filterdelete1/$',filterdelete1,name='filterdelete1'),
	url(r'^searchwlogin/$',searchwlogin,name='searchwlogin'),
	url(r'^product_search_user/$',product_search_user,name='product_search_user'),
	url(r'^viewbill/$',viewbill,name='viewbill'),
	url(r'^download/$',download,name='download'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += staticfiles_urlpatterns()