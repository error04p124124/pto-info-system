"""
WSGI config for pto_info_system project.
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pto_info_system.settings')

application = get_wsgi_application()

# Wrap with WhiteNoise for production static files
try:
    from whitenoise import WhiteNoise
    application = WhiteNoise(application, root=os.path.join(os.path.dirname(os.path.dirname(__file__)), 'staticfiles'))
    application.add_files(os.path.join(os.path.dirname(os.path.dirname(__file__)), 'static'), prefix='static/')
except ImportError:
    pass  # WhiteNoise not installed, running in development
