let bg_color = "#212121"
let fg_color = "#F7F0FF"
let red = "#FB618D"
let green = "#7BD78E"
let yellow = "#FBE566"
let orange = "#FC9253"
let purple = "#948AE2"
let blue = "#5AD3E5"
let muted_gray = "#69666C"

let monokai_theme = {
    separator: $fg_color
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: $green attr: "b" }
    empty: $blue
    bool: {|| if $in { $orange } else { $muted_gray } }
    int: $fg_color
    filesize: {|e|
        if $e == 0b {
            $fg_color
        } else if $e < 1mb {
            $blue
        } else {{ fg: $purple }}
    }
    duration: $fg_color
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: $red attr: "b" }
        } else if $in < 6hr {
            $red
        } else if $in < 1day {
            $orange
        } else if $in < 3day {
            $green
        } else if $in < 1wk {
            { fg: $green attr: "b" }
        } else if $in < 6wk {
            $blue
        } else if $in < 52wk {
            $purple
        } else { $muted_gray }
    }
    range: $fg_color
    float: $fg_color
    string: $orange
    nothing: $muted_gray
    binary: $fg_color
    cellpath: $fg_color
    row_index: { fg: $green attr: "b" }
    record: $fg_color
    list: $fg_color
    block: $fg_color
    hints: $muted_gray
    search_result: { fg: $fg_color bg: $red }

    shape_and: { fg: $red attr: "b" }
    shape_binary: { fg: $red attr: "b" }
    shape_block: { fg: $purple attr: "b" }
    shape_bool: $orange
    shape_custom: $green
    shape_datetime: { fg: $blue attr: "b" }
    shape_directory: $blue
    shape_external: $blue
    shape_externalarg: { fg: $green attr: "b" }
    shape_filepath: $blue
    shape_flag: { fg: $purple attr: "b" }
    shape_float: { fg: $red attr: "b" }
    shape_garbage: { fg: $fg_color bg: $red attr: "b" }
    shape_globpattern: { fg: $blue attr: "b" }
    shape_int: { fg: $red attr: "b" }
    shape_internalcall: { fg: $blue attr: "b" }
    shape_list: { fg: $blue attr: "b" }
    shape_literal: { fg: $red attr: "b" }
    shape_match_pattern: $green
    shape_matching_brackets: { attr: "u" }
    shape_nothing: $blue
    shape_operator: $orange
    shape_or: { fg: $red attr: "b" }
    shape_pipe: { fg: $red attr: "b" }
    shape_range: { fg: $orange attr: "b" }
    shape_record: { fg: $blue attr: "b" }
    shape_redirection: { fg: $red attr: "b" }
    shape_signature: { fg: $green attr: "b" }
    shape_string: $orange
    shape_string_interpolation: { fg: $blue attr: "b" }
    shape_table: { fg: $purple attr: "b" }
    shape_variable: $red

    background: $bg_color
    foreground: $fg_color
    cursor: $fg_color
}
  
  
$env.config = {
    show_banner: false
    edit_mode: vi
    shell_integration: {
        osc2: true
        osc7: true
        osc8: true
        osc9_9: false
        osc133: true
        osc633: true
        reset_application_mode: true
    }
    footer_mode: 25
    float_precision: 2
    use_ansi_coloring: true
    bracketed_paste: true
    color_config: $monokai_theme
    
    ls: {
    use_ls_colors: true
    clickable_links: true
    }

    rm: {
    always_trash: false
    }

    table: {
    mode: rounded
    index_mode: always
    show_empty: true
    padding: { left: 1, right: 1 }
    trim: {
        methodology: wrapping
        wrapping_try_keep_words: true
        truncating_suffix: "..."
    }
    }

    history: {
    max_size: 100_000
    sync_on_enter: true
    file_format: "plaintext"
    isolation: false
    }

    completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "prefix"
    external: {
        enable: true
        max_results: 100
        completer: null
    }
    }

    cursor_shape: {
        vi_insert: "line"
        vi_normal: "block"
    }

    filesize: {
    metric: true
    format: "auto"
    }
}

$env.PROMPT_INDICATOR_VI_INSERT = "❯ "
$env.PROMPT_INDICATOR_VI_NORMAL = "❮ "
