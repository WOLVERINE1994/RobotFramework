import random
import string
from robot.api.deco import library, keyword # type: ignore
from robot.libraries.BuiltIn import BuiltIn # type: ignore

@library
class custom_email:

    def __init__(self):
        self.selLib = None

    def _get_selenium_library(self):
        if self.selLib is None:
            self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        return self.selLib

    @keyword
    def generate_random_email(self, domain):
        username = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
        email = username + domain
        print("Generated email:", email)
        selLib = self._get_selenium_library()
        selLib.input_text("form-email", email)
        return email

