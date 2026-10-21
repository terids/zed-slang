;; Variables
(identifier) @variable

(field_identifier) @property

(statement_identifier) @label

;; Keywords
[
  "if"
  "else"
  "while"
  "for"
  "do"
  "switch"
  "case"
  "default"
  "break"
  "continue"
  "return"
  "discard"
  "goto"
  "try"
  "catch"
  "throw"

  "namespace"
  "extension"
  "interface"
  "dyn"
  "some"
  "struct"
  "class"
  "enum"
  "union"
  "cbuffer"
  "typedef"
  "using"
  "template"
  "typename"
  "associatedtype"
  "where"

  "import"
  "export"
  "module"

  "as"
  "is"
  "new"
  "delete"
  "sizeof"
  "alignof"
  "offsetof"
  "decltype"
  "operator"

  "public"
  "private"
  "protected"
  "friend"
  "virtual"
  "override"
  "final"
  "explicit"
  "noexcept"
  "static_assert"

  "in"
  "out"
  "inout"
  "let"
  "var"
] @keyword

(storage_class_specifier) @keyword
(type_qualifier) @keyword
(qualifiers) @keyword
(virtual_specifier) @keyword
(access_specifier) @keyword
(placeholder_type_specifier) @keyword

;; Properties
[
  "property"
  "get"
  "set"
] @keyword

;; Special methods
[
  "__init"
  "__subscript"
] @keyword

;; Pre-processor directives
[
  "#include"
  "#define"
  "#ifdef"
  "#ifndef"
  "#if"
  "#else"
  "#elif"
  "#endif"
  (preproc_directive)
] @keyword

"defined" @function.builtin

;; Types
(type_identifier) @type
(primitive_type) @type.builtin
(sized_type_specifier) @type.builtin

((type_identifier) @type.builtin
  (#match? @type.builtin "^(bool|int|uint|half|float|double|u?int(8|16|64)_t|float16_t|float64_t)([1-4](x[1-4])?)?$"))

(struct_specifier name: (type_identifier) @type)
(interface_specifier name: (type_identifier) @type)
(extension_specifier name: (type_identifier) @type)
(class_specifier name: (type_identifier) @type)
(enum_specifier name: (type_identifier) @type)

(base_class_clause
  (type_identifier) @type)

(interface_requirements
  (identifier) @type)

;; Namespaces
(namespace_identifier) @namespace

;; Literals
(number_literal) @number
(string_literal) @string
(raw_string_literal) @string
(system_lib_string) @string
(char_literal) @string
(escape_sequence) @string.escape

[
  (true)
  (false)
] @boolean

(null) @constant.builtin

(this) @variable.special

(enumerator
  name: (identifier) @constant)

;; Comments
(comment) @comment

;; Functions
(function_declarator
  declarator: (identifier) @function)

(function_declarator
  declarator: (field_identifier) @function)

(function_declarator
  declarator: (qualified_identifier
    name: (identifier) @function))

(template_function
  name: (identifier) @function)

(call_expression
  function: (identifier) @function.call)

((call_expression
  function: (identifier) @type.builtin)
  (#match? @type.builtin "^(bool|int|uint|half|float|double|u?int(8|16|64)_t|float16_t|float64_t)([1-4](x[1-4])?)?$"))

(call_expression
  function: (qualified_identifier
    name: (identifier) @function.call))

(call_expression
  function: (template_function
    name: (identifier) @function.call))

(call_expression
  function: (field_expression
    field: (field_identifier) @function.method.call))

(call_expression
  function: (field_expression
    field: (template_method
      name: (field_identifier) @function.method.call)))

(preproc_def
  name: (identifier) @constant)

(preproc_function_def
  name: (identifier) @function.special)

;; Declarations
(type_hinted_declarator
  (identifier) @variable)

(init_declarator
  declarator: (identifier) @variable)

(parameter_declaration
  declarator: (identifier) @variable.parameter)

(property_declaration
  (identifier) @property)

(declaration
  type: (_)
  .
  (qualifiers) @variable)

(field_declaration
  type: (_)
  .
  (qualifiers) @property)

(parameter_declaration
  type: (_)
  .
  (qualifiers) @variable.parameter)

(ERROR
  .
  (qualifiers) @variable)

(translation_unit
  (labeled_statement
    label: (statement_identifier) @variable))

(declaration_list
  (labeled_statement
    label: (statement_identifier) @variable))

;; Attributes
(hlsl_attribute
  (identifier) @attribute)

(hlsl_attribute
  (call_expression
    function: (identifier) @attribute))

;; Semantics
(bitfield_clause (identifier) @type)
(semantics (identifier) @type)

;; Operators
(binary_expression operator: _ @operator)
(assignment_expression operator: _ @operator)
(update_expression operator: _ @operator)
(unary_expression operator: _ @operator)

[ "," "." ":" "::" ";" "->" ] @punctuation.delimiter
[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket

(conditional_expression [ "?" ":" ] @operator)

(template_argument_list [ "<" ">" ] @punctuation.bracket)
(template_parameter_list [ "<" ">" ] @punctuation.bracket)
