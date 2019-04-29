$(document).ready(function(){
    
    $("#cal").on("click",function(){
        
        
        var numPro = parseInt($("#numPro").val());
        var hrsOp = parseInt($("#hrsOp").val());
        var validar = false;
        
        for (var i = 1; i <= numPro; i++) {
            var canTra = $("#cantTrab"+i).val();
           
            if(canTra===""){
                validar = true;
                swal('Error!', 'Digite la cantidad de trabajadores que se solicitaran a cada proveedor que asignará al servicio', 'error');
                break;
            }
            
        }
        
        for (var i = 1; i <= numPro; i++) {
            
            var canTra = $("#cantTrab"+i).val();
            if(validar){
                swal('Error!', 'Digite la cantidad de trabajadores que se solicitaran a cada proveedor que asignará al servicio', 'error');
                break;
            }else{
                $("#btnAsignar").removeClass("ocultar");
                var hrsTot = $("#hrsTotales"+i);
                hrsTot.val(hrsOp*parseInt(canTra));
            }
            
        }
        
    });
    
    $('.cantTrabajadores').keyup(function(){
        $("#btnAsignar").addClass("ocultar");
    });
});