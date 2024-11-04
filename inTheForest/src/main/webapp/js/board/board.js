const getPrevBookNo = (writeDate, category) => {
    fetch(`boardPrevNext.do?writeDate=${writeDate}&category=${category}`)
        .then((resolve) => {
            return resolve.json()
        }).then(success)
        .catch((err) => {
            console.log(err)
        })
}