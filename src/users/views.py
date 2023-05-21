from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(['GET'])
def home_page(request):
    '''Hi :)'''
    return Response(
        {'User API': 'http://127.0.0.1:8000/api/accounts/',
        'Team API': 'http://127.0.0.1:8000/api/team/',
        'Tasks API': 'http://127.0.0.1:8000/api/task/',
        'ADMIN': 'http://127.0.0.1:8000/admin/'}
    )
