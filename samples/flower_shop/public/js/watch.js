function watch(obj, paths, callbacks) {
  if (paths.forEach == undefined){
    paths = [paths];
  }
  if (callbacks.forEach == undefined){
    callbacks = [callbacks];
  }
  paths.forEach(function(path){
    callbacks.forEach(function(callback){
      (new PathObserver(obj, path)).open(callback);
    });
  });
}

function mutualExclusion(obj, fields) {
  fields.forEach(function(field){
    (new PathObserver(obj, field)).open(function () {
      fields.forEach(function (otherField) {
        if (otherField != field && obj[field] == true) {
          obj[otherField] = false;
        }
      })
    });
  });
}
