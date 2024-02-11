function doLike(pid, uid) {
    console.log(pid + "," + uid);
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    }

    $.ajax({
        url: 'http://localhost:9495/TechBlog/LikeServlet',
        data: d,
        method: 'GET',
        success: function (data, textStatus, jqXHR) {
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error(errorThrown); // Log the error
        }
    });
}



