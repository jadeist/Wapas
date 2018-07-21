(function() {
  angular.module('testMod', ['ngMaterial']).controller('testCtrl', function($scope) {
    return $scope.date = new Date();
  }).directive('timeDatePicker', [
    '$filter', '$sce', '$rootScope',
    function($filter, $sce, $rootScope) {
      var _dateFilter;
      _dateFilter = $filter('date');
      return {
        restrict: 'AE',
        replace: true,
        scope: {
          _modelValue: '=ngModel'
        },
        require: 'ngModel',
        templateUrl: 'time-date.tpl',
        link: function(scope, element, attrs, ngModel) {
          attrs.$observe('defaultMode', function(val) {
            return scope._mode = val != null ? val : 'date';
          });
          attrs.$observe('displayMode', function(val) {
            return scope._displayMode = val;
          });
          attrs.$observe('orientation', function(val) {
            return scope._verticalMode = val === 'true';
          });
          attrs.$observe('displayTwentyfour', function(val) {
            return scope._hours24 = (val != null) && val;
          });
          attrs.$observe('mindate', function(val) {
            if ((val != null) && angular.isDate(val)) {
              return scope.restrictions.mindate = val;
            }
          });
          attrs.$observe('maxdate', function(val) {
            if ((val != null) && angular.isDate(val)) {
              return scope.restrictions.maxdate = val;
            }
          });
          ngModel.$render = function() {
            return scope.setDate(ngModel.$modelValue);
          };
          scope.save = function() {
            return scope._modelValue = scope.date;
          };
          return scope.cancel = function() {
            return ngModel.$render();
          };
        },
        controller: [
          '$scope',
          function(scope) {
            var i;
            scope.restrictions = {
              mindate: void 0,
              maxdate: void 0
            };
            scope.setDate = function(newVal) {
              scope.date = newVal != null ? new Date(newVal) : new Date();
              scope.calendar._year = scope.date.getFullYear();
              scope.calendar._month = scope.date.getMonth();
              scope.clock._minutes = scope.date.getMinutes();
              return scope.clock._hours = scope._hours24 ? scope.date.getHours() : scope.date.getHours() % 12;
            };
            scope.display = {
              fullTitle: function() {
                return _dateFilter(scope.date, 'EEEE d MMMM yyyy, h:mm a');
              },
              title: function() {
                if (scope._mode === 'date') {
                  return _dateFilter(scope.date, (scope._displayMode === 'date' ? 'EEEE' : 'EEEE h:mm a'));
                } else {
                  return _dateFilter(scope.date, 'MMMM d yyyy');
                }
              },
              "super": function() {
                if (scope._mode === 'date') {
                  return _dateFilter(scope.date, 'MMM');
                } else {
                  return '';
                }
              },
              main: function() {
                return $sce.trustAsHtml(scope._mode === 'date' ? _dateFilter(scope.date, 'd') : "" + (_dateFilter(scope.date, 'h:mm')) + "<small>" + (_dateFilter(scope.date, 'a')) + "</small>");
              },
              sub: function() {
                if (scope._mode === 'date') {
                  return _dateFilter(scope.date, 'yyyy');
                } else {
                  return _dateFilter(scope.date, 'HH:mm');
                }
              }
            };
            scope.calendar = {
              _month: 0,
              _year: 0,
              _months: (function() {
                var _i, _results;
                _results = [];
                for (i = _i = 0; _i <= 11; i = ++_i) {
                  _results.push(_dateFilter(new Date(0, i), 'MMMM'));
                }
                return _results;
              })(),
              offsetMargin: function() {
                return "" + (new Date(this._year, this._month).getDay() * 2.7) + "rem";
              },
              isVisible: function(d) {
                return new Date(this._year, this._month, d).getMonth() === this._month;
              },
              "class": function(d) {
                if (new Date(this._year, this._month, d).getTime() === new Date(scope.date.getTime()).setHours(0, 0, 0, 0)) {
                  return "selected";
                } else if (new Date(this._year, this._month, d).getTime() === new Date().setHours(0, 0, 0, 0)) {
                  return "today";
                } else {
                  return "";
                }
              },
              select: function(d) {
                return scope.date.setFullYear(this._year, this._month, d);
              },
              monthChange: function() {
                if ((this._year == null) || isNaN(this._year)) {
                  this._year = new Date().getFullYear();
                }
                scope.date.setFullYear(this._year, this._month);
                if (scope.date.getMonth() !== this._month) {
                  return scope.date.setDate(0);
                }
              },
              _incMonth: function(months) {
                this._month += months;
                while (this._month < 0 || this._month > 11) {
                  if (this._month < 0) {
                    this._month += 12;
                    this._year--;
                  } else {
                    this._month -= 12;
                    this._year++;
                  }
                }
                return this.monthChange();
              }
            };
            scope.clock = {
              _minutes: 0,
              _hours: 0,
              _incHours: function(inc) {
                return this._hours = scope._hours24 ? Math.max(0, Math.min(23, this._hours + inc)) : Math.max(1, Math.min(12, this._hours + inc));
              },
              _incMinutes: function(inc) {
                return this._minutes = Math.max(0, Math.min(59, this._minutes + inc));
              },
              setAM: function(b) {
                if (b == null) {
                  b = !this.isAM();
                }
                if (b && !this.isAM()) {
                  return scope.date.setHours(scope.date.getHours() - 12);
                } else if (!b && this.isAM()) {
                  return scope.date.setHours(scope.date.getHours() + 12);
                }
              },
              isAM: function() {
                return scope.date.getHours() < 12;
              }
            };
            scope.$watch('clock._minutes', function(val) {
              if ((val != null) && val !== scope.date.getMinutes()) {
                return scope.date.setMinutes(val);
              }
            });
            scope.$watch('clock._hours', function(val) {
              if (val != null) {
                if (!scope._hours24) {
                  if (val === 24) {
                    val = 12;
                  } else if (val === 12) {
                    val = 0;
                  } else if (!scope.clock.isAM()) {
                    val += 12;
                  }
                }
                if (val !== scope.date.getHours()) {
                  return scope.date.setHours(val);
                }
              }
            });
            scope.setNow = function() {
              return scope.setDate();
            };
            scope._mode = 'date';
            scope.modeClass = function() {
              if (scope._displayMode != null) {
                scope._mode = scope._displayMode;
              }
              return "" + ((scope._verticalMode != null) && scope._verticalMode ? 'vertical ' : '') + (scope._displayMode === 'full' ? 'full-mode' : scope._displayMode === 'time' ? 'time-only' : scope._displayMode === 'date' ? 'date-only' : scope._mode === 'date' ? 'date-mode' : 'time-mode');
            };
            scope.modeSwitch = function() {
              var _ref;
              return scope._mode = (_ref = scope._displayMode) != null ? _ref : scope._mode === 'date' ? 'time' : 'date';
            };
            return scope.modeSwitchText = function() {
              if (scope._mode === 'date') {
                return 'Clock';
              } else {
                return 'Calendar';
              }
            };
          }
        ]
      };
    }
  ]);

}).call(this);