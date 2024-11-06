const getPrevBookNo = (writeDate, category, isPrev, success) => {
    let url= `boardPrevNext.do?writeDate=${writeDate}&category=${category}&isPrev=${isPrev}`
    fetch(url)
        .then((resolve) => {
            return resolve.json()
        }).then(success)
        .catch((err) =>
        {console.log(err)})
        }


const getNextBookNo = (writeDate, category, isPrev, success) => {
    let url= `boardPrevNext.do?writeDate=${writeDate}&category=${category}&isPrev=${isPrev}`
    fetch(url)
        .then((resolve) => {
            return resolve.json()
        }).then(success)
        .catch((err) => {
            console.log(err)
        })
}