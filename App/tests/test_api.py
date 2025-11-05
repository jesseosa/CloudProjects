from app.main import transform_word

def test_transform_examples():
    assert transform_word("fOoBar25") == "52RAboOf"  
    assert transform_word("foo") == "OOF"[::-1]    
    assert transform_word("FOO") == "foo"[::-1]     
