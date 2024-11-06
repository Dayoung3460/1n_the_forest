const getSiteUse = (siteNo, useFlag) => {
    let url= `siteUse.do?siteNo=${siteNo}&useFlag=${useFlag}`
    fetch(url)
        .then(resolve => resolve.json())
        .then(result => {
			if (result.retCode == 'OK') {
				alert("상태를 변경하였습니다.");
			} else if (result.retCode == 'FAIL') {
				alert('변경 중 오류 발생')
			}
		})
        .catch(err => console.log(err));
}