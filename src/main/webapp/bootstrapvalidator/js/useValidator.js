$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#defaultForm').add('#defaultForm2').bootstrapValidator({
//        live: 'disabled',
        message: '请输入有效内容',
        feedbackIcons: {
            valid: 'fa fa-check text-success',
            invalid: 'fa fa-times text-danger',
            validating: 'fa fa-refresh text-muted'
        },
        fields: {
            username: {
                message: '请输入有效内容',
                validators: {
                    notEmpty: {
                        message: '此处不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名在6-30个字符之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: '用户名只能由字母、数字、点和下划线组成'
                    },
                    remote: {
                        url: 'XXX',
                        message: '该用户名不可用'
                    },
                    different: {
                        field: 'password',
                        message: '用户名和密码不能相同'
                    }
                }
            },
            email: {
                validators: {
										notEmpty: {
                        message: '此处不能为空'
                    },
                    emailAddress: {
                        message: '请输入有效的邮箱地址'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '此处不能为空'
                    },
										stringLength: {
                        min: 6,
                        max: 30,
                        message: '密码在6-30个字符之间'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: '两次输入的密码不一致'
                    },
                    different: {
                        field: 'username',
                        message: '密码不能与用户名相同'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: '此处不能为空'
                    },
                    identical: {
                        field: 'password',
                        message: '两次输入的密码不一致'
                    },
                    different: {
                        field: 'username',
                        message: '密码不能与用户名相同'
                    }
                }
            },
            gender: {
                validators: {
                    notEmpty: {
                        message: '此项是必需的'
                    }
                }
            },
            captcha: {
                validators: {
                    callback: {
                        message: '验证码错误',
                        callback: function(value, validator) {
                            var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                            return value == sum;
                        }
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').add('#defaultForm2').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#defaultForm2').data('bootstrapValidator').resetForm(true);
    });
});