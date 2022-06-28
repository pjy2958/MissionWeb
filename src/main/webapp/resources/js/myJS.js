function isNull(obj, msg) {
    if(obj.value == ''){
        alert(msg + "를 입력하세요");
        obj.focus();
        return true;
    }
    return false;
}