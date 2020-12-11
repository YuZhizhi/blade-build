 " This is the Vim syntax file for Blade.
" Author: Chen Feng <phongchen@tencent.com>

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Read the python syntax to start with
if version < 600
    so <sfile>:p:h/python.vim
else
    runtime! syntax/python.vim
    unlet b:current_syntax
endif

syn case match

" Sorted by alphabet order
syn keyword bladeTarget cc_binary cc_library cc_plugin cc_test cc_benchmark cu_binary cu_library
syn keyword bladeTarget enable_if gen_rule lex_yacc_library proto_library
syn keyword bladeTarget java_library java_binary java_test maven_jar java_fat_library
syn keyword bladeTarget package py_binary py_library py_test
syn keyword bladeTarget scala_library scala_test scala_fat_library sh_test
syn keyword bladeTarget resource_library swig_library thrift_library

syn keyword bladeTarget prebuilt_cc_library
syn keyword bladeTarget foreign_cc_library
syn keyword bladeArg libpath_pattern has_dynamic binary_link_only

" TODO(chen3feng): Reorgnize by target
" Sorted by alphabet order
syn keyword bladeArg always_run binary_jar cmd coverage defs deprecated deps dynamic_link embed_version
syn keyword bladeArg exclude exclusions exclusive export_dynamic export_incs exported_deps hdrs
syn keyword bladeArg extra_cppflags extra_linkflags generate_descriptors generate_hdrs glob allow_empty
syn keyword bladeArg heap_check heap_check_debug heavy include incs link_all_symbols main_class
syn keyword bladeArg name optimize out outs plugins prebuilt prefix provided_deps
syn keyword bladeArg resources secure source_encoding srcs suffix
syn keyword bladeArg target_languages testdata transitive visibility warning warnings

if version >= 508 || !exists("did_blade_syn_inits")
    if version < 508
        let did_blade_syn_inits = 1
        command! -nargs=+ HiLink hi link <args>
    else
        command! -nargs=+ HiLink hi def link <args>
    endif

    HiLink bladeTarget   Function
    HiLink bladeArg      Special
    delcommand HiLink
endif

let b:current_syntax = "blade"
