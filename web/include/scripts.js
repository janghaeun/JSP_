//Email Form Checking
function isCorrectEmail(fname, ename) {

    var i;

    var position_at = 0; // 0 or 1 가짐 0은 아이디 1은 서버 값(@뒤에 오는 도메인)
    var dot = 0;
    var id = "";
    var server = "";

    var email = eval("document." + fname + "." + ename); //js 객체로 만듬
    
    for (i = 0;i<email.value.length;i++){
        
        if (email.value.charAt(i) == '@'){
            position_at +=1;
        } 
        
        else if (position_at == 0){
            id += email.value.charAt(i);
        } 
        
        else{
            server += email.value.charAt(i); 
        }
        
    } 


    if (position_at>=2 || position_at == 0){
        alert("postion error");
        return false;
    } 
    
    for (i =  0; i<id.length; i++){
        if (! ((id.charAt(i) >= 'A' && id.charAt(i) <= 'z') || (id.charAt(i) >='0' && id.charAt(i) <= '9') || (id.charAt(i) =='_') || id.charAt(i) =='-')){

            alert("id error");
            return false
        } 
    }
    
    for (i = 0;i<server.length; i++){
        if (server.charAt(i) == '.'){
            dot += 1;
        } 
    } 
    
    if (dot<1){
        alert("dot error");
        return false;
    } 
    
    if (server.charAt(server.length-1) == '.'){
        alert("server dot error");
        return false;
    }

    for (i = 0;i<server.length; i++) {
        if (!((server.charAt(i) >= 'A' && server.charAt(i) <= 'z') || (server.charAt(i) >= '0' && server.charAt(i) <= '9') || (server.charAt(i) == '.') || server.charAt(i) == '-')) {
            alert("server error");
            return false;
        }
    }

return true;
}


function Korean() {

    // ctrl, shift, alt 입력X
    if (event.ctrlKey || event.shiftKey || event.shiftLeft || event.altKey) {
        event.returnValue = false;
        return false;
    }


    if (event.keyCode == 8 || event.keyCode == 9||event.keyCode == 35 || event.keyCode == 36 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46) {
        event.returnValue = true;
        return;
    }

    if (event.keyCode < 12592 || event.keyCode > 12687) {
        event.returnValue = false;
        return false;
    }
}