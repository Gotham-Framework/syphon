## Syphon

Easily serialize forms into a JSON representation. Inspired from [Backbone.Syphon](https://github.com/marionettejs/backbone.syphon).

```html
<form id="new">
  <input type="text" name="name" value="mrZombie" />
  <input type="text" name="lvl" value="25" />
</form>
```

Will become : 

```json
{
  name: "mrZombie",
  lvl: "25"
}
```

## Installation 

```
bower install --save gotham-syphon
```

## Examples 

## Api


## How to compile source files 

In the root of the project, execute that : 

```
coffee --compile --watch --output dist/ src/
```

## Tests 
Test are written with Qunit, just launch with your browser the file ```tests/index.html```