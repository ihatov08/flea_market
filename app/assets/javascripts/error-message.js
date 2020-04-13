$(document).on('turbolinks:load',function(){
    
    // 商品出品エラーメッセージ表示
    $(".sell-main__form").validate({
        rules: {
            "product[images][]": { required: true, minlength: 1, maxlength: 10 },
            "product[name]": { required: true, maxlength: 40 },
            "product[description]": { required: true, maxlength: 1000 },
            "product[category_id]": { required: true },
            "product[condition_id]": { required: true },
            "product[delivery_charge_id]": { required: true },
            "product[prefecture_id]": { required: true },
            "product[delivery_days_id]": { required: true },
            "product[price]": { required: true }
        },
        messages: {
            "product[images][]": { required: "画像がありません" },
            "product[name]": { required: "入力してください" },
            "product[description]": { maxlength: "1000文字以下で入力してください" },
            "product[category_id]":　{ reguired: true, choice: "選択してくだい" },
            "product[price]": { required: "300から9999999までの値を入力してください" },
            "product[category_id]": { required: "選択してください" },
            "product[condition_id]": { required: "選択してください" },
            "product[delivery_charge_id]": { required: "選択してください" },
            "product[prefecture_id]": { required: "選択してください" },
            "product[delivery_days_id]": { required: "選択してください" }
        }
    });
});