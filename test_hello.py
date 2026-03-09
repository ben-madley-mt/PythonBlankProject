from hello import Hello


def test_hello():
    assert Hello().hello() == "Hello, world!"
