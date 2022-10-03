from django.contrib import admin
from django.urls import path, include
from stores import views
# urlpatterns = [
#     path('/stores?editor={{selected-editor}}&category={{selected-category}}', views.selected_stores, name = "selected"),
# ]

urlpatterns = [
    path('selected/', views.selected_stores, name="selected"),
    path('edit/', views.edit, name="edit"),
    path('save/', views.save, name="save"),
    # path('store-info/', views.stores_information, name=""),
    # path('random/',views.random_store, name = "random"),
    # path('imformation/',views.stores_imformation, name = "stores_imformation"),
    path('store-info/<str:store_id>/', views.stores_information, name="stores_information"),
]