//#2 Вывести реакции на треки с оценкой больше 3 (проекция должна содержать имя автора реакции и название трека)
db.getCollection("reactions").aggregate([
  {  $lookup: {
            from: 'tracks', // откуда берем данные
            localField: 'track_id', // локальное поле
            foreignField: '_id', // внешнее поле
            as: 'title' // куда поместить результат
         } } ,  { $unwind: '$title' },
         {  $lookup: {
            from: 'users', // откуда берем данные
            localField: 'author_id', // локальное поле
            foreignField: '_id', // внешнее поле
            as: 'author' // куда поместить результат
        }  }     , { $unwind: '$author' },
{ $match: { value: { $gte: 3 } } },
{$project: {_id:0, value:1, 
    track_id:1, track_title: '$title.title',
    author_id:1 , author_fullname: '$author.fullname' } }

])
