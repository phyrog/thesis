# thesis
My master thesis LaTeX class

## Dependencies

* biber (might already be installed in your standard LaTeX distribution)
* latexmk
* pygments (the version for python2; best install via `(sudo) pip2 install pygments`)

## How to use

* copy all `example.*` files to `<newname>.*`
* change the line with `\addbibresource` in the main `.tex` file
* `make <newname>`

### Glossaries

To use glossaries in combination with latexmk, you need to put the following into `~/.latexmkrc`:

```
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
sub makeglossaries {
  system("makeglossaries \"$_[0]\"");
}
```

## Example PDF output
[Example PDF](/../screenshots/example.pdf?raw=true)

![frontpage screenshot](/../screenshots/frontpage.png?raw=true)
