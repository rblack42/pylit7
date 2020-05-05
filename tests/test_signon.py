import unittest
from pyrst.utils import signon

class TestSignon(unittest.TestCase):

    def setUp(self):
        pass

    def test_sanity(self):
        self.assertTrue('pylit7' in signon())

    def tearDown(self):
        pass

if __name__ =='__main__':
    unittest.main()
