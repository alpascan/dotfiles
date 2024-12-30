let monokai_theme = {
    # Colors for Nushell primitives
    separator: "#F8F8F2"
    leading_trailing_space_bg: { attr: n }
    header: { fg: "#A6E22E" attr: b }
    empty: "#66D9EF"
    bool: "#FD971F"
    int: "#A6E22E"
    filesize: "#F92672"
    duration: "#AE81FF"
    date: "#E6DB74"
    range: "#A1EFE4"
    float: "#66D9EF"
    string: "#FD971F"  # Bright orange for strings
    nothing: "#75715E"
    binary: "#FD971F"
    cell-path: "#F8F8F2"
    row_index: { fg: "#AE81FF" attr: b }
    record: "#F92672"
    list: "#A1EFE4"
    block: "#E6DB74"
    hints: "#75715E"
    search_result: { fg: "#F8F8F2" bg: "#F92672" }
  
    # Shapes for CLI syntax highlighting
    shape_garbage: { fg: "#F8F8F2" bg: "#F92672" attr: b}
    shape_binary: { fg: "#A1EFE4" attr: b }
    shape_bool: "#FD971F"
    shape_int: { fg: "#A6E22E" attr: b }
    shape_float: { fg: "#66D9EF" attr: b }
    shape_range: { fg: "#FD971F" attr: b }
    shape_internalcall: { fg: "#AE81FF" attr: b }
    shape_external: "#66D9EF"
    shape_externalarg: { fg: "#A6E22E" attr: b }
    shape_literal: "#FD971F"
    shape_operator: "#F92672"
    shape_signature: { fg: "#A6E22E" attr: b }
    shape_string: "#FD971F"
    shape_filepath: "#A1EFE4"
    shape_globpattern: { fg: "#66D9EF" attr: b }
    shape_variable: "#FD971F"
    shape_flag: { fg: "#66D9EF" attr: b }
    shape_custom: "#A6E22E"
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

    cursor_shape: {
    emacs: block
    vi_insert: block
    vi_normal: underscore
    }
}