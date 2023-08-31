<!DOCTYPE html>
<head>
    <script>
      	
        function requestPay() {
            IMP.request_pay(
                {
     				
                },
                function (rsp) {
      				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        $.ajax({
                            url: "/payment/validate/" + rsp.imp_uid,
                            method: "GET",
                            contentType: "application/json",
                            data: JSON.stringify({
                                imp_uid: rsp.imp_uid,            // 결제 고유번호
                                merchant_uid: rsp.merchant_uid,   // 주문번호
                                amount: rsp.paid_amount
                            }),
                        }).done(function (data) {
                            // 가맹점 서버 결제 API 성공시 로직
                        })
                    } else {
                        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                    }
                }
            );
        }
    </script>
	
</html>