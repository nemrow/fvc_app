var Model = {
  weeksData: null,

  getWeeksData: function () {
    Model.weeksData = Model.weeksData || Model.buildWeeksData();
    return Model.weeksData;
  },

  buildWeeksData: function () {
    var weeksData = [];
    var FIRST_MIN_DATE = new Date(2014, 5, 21, 12, 0);
    var FIRST_MAX_DATE = new Date(2014, 5, 28, 12, 0);

    for (i=0; i < 8; i++) {
      var minDateClone = new Date(FIRST_MIN_DATE);
      var maxDateClone = new Date(FIRST_MAX_DATE);

      var currentMinDate = minDateClone.setDate(minDateClone.getDate() + (7*i));
      var currentMaxDate = maxDateClone.setDate(maxDateClone.getDate() + (7*i));

      var thisWeeksData = {
        weekNum: i,
        minDate: new Date(currentMinDate),
        maxDate: new Date(currentMaxDate)
      }

      weeksData.push(thisWeeksData);
    }
    return weeksData;
  }
};