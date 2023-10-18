//#3 Вывести юзера, у которого больше всего треков (проекция должна содержать имя юзера)
db.getCollection("tracks").aggregate([
    {  $lookup: {
                from: 'users', // откуда берем данные
                localField: 'author_id', // локальное поле
                foreignField: '_id', // внешнее поле
                as: 'author' // куда поместить результат
            }  }     , { $unwind: '$author' },
        { $group: {
                _id: "author_id", // поле группировки
                total_tracks: { $sum: "author_id" }  }},
    {$project: {_id:0, 
      //  track_id:1, track_title: '$title.title',
        author_id:1 , author_fullname: '$author.fullname',
        total_tracks:1} }   ])
         