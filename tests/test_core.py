from holocron.core import calculate_midichlorians, greet_padawan


def test_calculate_midichlorians() -> None:
    assert calculate_midichlorians(1000, 20) == 20000


def test_greet_padawan() -> None:
    assert greet_padawan("Anakin") == "May the Force be with you, Anakin!"
