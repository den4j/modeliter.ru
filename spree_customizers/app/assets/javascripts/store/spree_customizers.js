function thumbs(thumbs_list_selector, display_image_selector) {
    var list = $(thumbs_list_selector);
    var display_image = $(display_image_selector);
    var list_items = list.find("li img");
    list_items.each(function() {
        var src = $(this).attr("src");
        var alt = $(this).attr("alt");
        var img = $("<img class='display_image_item' src='" + src + "' alt='" + alt + "' />");
        display_image.append(img);
        if ($(this).is(".current")) {
            img.show();
        } else {
            img.hide();
        }
        $(this).click(function() {
            var displayed_image = display_image.find(".display_image_item:visible");
            if (displayed_image.attr("src") != $(this).attr("src")) {
                list_items.removeClass("current");
                $(this).addClass("current");
                displayed_image.fadeOut("fast", function() {
                    img.fadeIn("slow");
                });
            }
        });
    });
}
var candle_patterns = {}; //list of candle patterns, should have 'default' key referencing the default pattern

function choose_candle_pattern_in_modal() {
    var value = $(this).attr('data-candle-pattern-value');
    var customizer = $(this).closest(".pattern_customizer");
    customizer.find("input").val(value).change();
    $(this).closest(".modal").modal('hide');
}

/**
 * Loads list of candle patterns from json_url, puts it into candle_patters[pattern_customizer_selector],
 * adds event to input in $(pattern_customizer_selector) to change background-image of customizer,
 * preloads modal to choose pattern
 * @param pattern_customizer_selector html-construction to customize candle's pattern
 * @param json_url
 */
function setup_candle_patterns_customizer(pattern_customizer_selector, json_url) {
    $.getJSON(json_url, function(data) {
        candle_patterns[pattern_customizer_selector] = data;
        var customizer = $(pattern_customizer_selector);
        var input = customizer.find("input");
        var choose_pattern_modal = customizer.find(".modal");
        var choose_pattern_button = $(pattern_customizer_selector + " .choose_pattern_button");
        input.change(function() {
            customizer.css(
                "background",
                "url('" + candle_patterns[pattern_customizer_selector][input.val()] + "') 50% 50% no-repeat");
        })
        input.val(candle_patterns[pattern_customizer_selector]['default']).change();

        var choose_pattern_list = $("<ul></ul>");
        choose_pattern_list.addClass("choose_pattern_list");
        $.each(data, function(value, image_url) {
            if (value != 'default') {
                var li = $("<li data-candle-pattern-value='" + value + "'></li>");
                var img = $("<img src='" + image_url + "' />");
                li.click(choose_candle_pattern_in_modal);
                li.append(img);
                choose_pattern_list.append(li);
            }
        });
        choose_pattern_modal.find(".modal-body").append(choose_pattern_list);
        choose_pattern_button.click(function() {
            choose_pattern_modal.modal();
        });
    });
}
function preview_candle_on_switch(switch_selector, candle_preview_selector) {
    var input = find_switched_input(switch_selector);
    var preview = $(candle_preview_selector);
    input.change(function() {
        preview.find("[data-switch-value]").hide();
        preview.find("[data-switch-value=" + input.val() + "]").show();
    })
    input.change();
}
function find_switched_input(switch_selector) {
    var input_name = $(switch_selector).attr("data-input-name");
    return $(switch_selector + " input[name=" + input_name + "]");
}
function select_switch_button(switch_selector) {
    var input = find_switched_input(switch_selector);
    $(switch_selector + " .switch-button").removeClass("selected");
    $(switch_selector + " .switch-button[data-value=" + input.val() + "]").addClass("selected");
}
function design_switch(switch_selector) {
    var switcher = $(switch_selector);
    var input = find_switched_input(switch_selector);
    select_switch_button(switch_selector);

    var buttons = switcher.find(".switch-button");

    buttons.click(function() {
        input.val($(this).attr("data-value")).change();
        select_switch_button(switch_selector);
    });

    buttons.mousedown(function() {
        $(this).addClass("active");
    })
    buttons.mouseup(function() {
        $(this).removeClass("active");
    })
    buttons.mouseout(function() {
        $(this).removeClass("active");
    })
}
