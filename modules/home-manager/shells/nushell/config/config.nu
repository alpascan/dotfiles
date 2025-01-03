let monokai_theme = {
    separator: "#F8F8F2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#A6E22E" attr: "b" }
    empty: "#66D9EF"
    bool: {|| if $in { "#FD971F" } else { "#75715E" } }
    int: "#F8F8F2"
    filesize: {|e|
        if $e == 0b {
            "#F8F8F2"
        } else if $e < 1mb {
            "#66D9EF"
        } else {{ fg: "#AE81FF" }}
    }
    duration: "#F8F8F2"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#F92672" attr: "b" }
        } else if $in < 6hr {
            "#F92672"
        } else if $in < 1day {
            "#FD971F"
        } else if $in < 3day {
            "#A6E22E"
        } else if $in < 1wk {
            { fg: "#A6E22E" attr: "b" }
        } else if $in < 6wk {
            "#66D9EF"
        } else if $in < 52wk {
            "#AE81FF"
        } else { "#75715E" }
    }
    range: "#F8F8F2"
    float: "#F8F8F2"
    string: "#E6DB74"
    nothing: "#75715E"
    binary: "#F8F8F2"
    cellpath: "#F8F8F2"
    row_index: { fg: "#A6E22E" attr: "b" }
    record: "#F8F8F2"
    list: "#F8F8F2"
    block: "#F8F8F2"
    hints: "#75715E"
    search_result: { fg: "#F8F8F2" bg: "#F92672" }

    shape_and: { fg: "#F92672" attr: "b" }
    shape_binary: { fg: "#F92672" attr: "b" }
    shape_block: { fg: "#AE81FF" attr: "b" }
    shape_bool: "#FD971F"
    shape_custom: "#A6E22E"
    shape_datetime: { fg: "#66D9EF" attr: "b" }
    shape_directory: "#66D9EF"
    shape_external: "#66D9EF"
    shape_externalarg: { fg: "#A6E22E" attr: "b" }
    shape_filepath: "#66D9EF"
    shape_flag: { fg: "#AE81FF" attr: "b" }
    shape_float: { fg: "#F92672" attr: "b" }
    shape_garbage: { fg: "#F8F8F2" bg: "#F92672" attr: "b" }
    shape_globpattern: { fg: "#66D9EF" attr: "b" }
    shape_int: { fg: "#F92672" attr: "b" }
    shape_internalcall: { fg: "#66D9EF" attr: "b" }
    shape_list: { fg: "#66D9EF" attr: "b" }
    shape_literal: { fg: "#F92672" attr: "b" }
    shape_match_pattern: "#A6E22E"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#66D9EF"
    shape_operator: "#FD971F"
    shape_or: { fg: "#F92672" attr: "b" }
    shape_pipe: { fg: "#F92672" attr: "b" }
    shape_range: { fg: "#FD971F" attr: "b" }
    shape_record: { fg: "#66D9EF" attr: "b" }
    shape_redirection: { fg: "#F92672" attr: "b" }
    shape_signature: { fg: "#A6E22E" attr: "b" }
    shape_string: "#E6DB74"
    shape_string_interpolation: { fg: "#66D9EF" attr: "b" }
    shape_table: { fg: "#AE81FF" attr: "b" }
    shape_variable: "#F92672"

    background: "#272822"
    foreground: "#F8F8F2"
    cursor: "#F8F8F2"
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

    filesize: {
    metric: true
    format: "auto"
    }

}
