function grab_img_file(){
    return document.getElementById("upload_file").files[0].name;
}

function update_img(){
    var img_file = grab_img_file();
    var src = "/assets/" + img_file;
    document.getElementById("image_tag_id").src = src;
}