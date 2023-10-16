//(1) Вывести среднюю оценку (реакцию) по треку 3

db.getCollection("reactions").aggregate([
    {   $match: { track_id: 3  }     }
    ,  {   $group: { _id: null, avgReactionsValue: { $avg: "$value" } } }
    ])


    // #1   Results:
    //{
  // "_id" : null,
 //   "avgReactionsValue" : 5.0
//}

// (2) Вывести три самых продолжительных трека 
// (название_трека, имя_автора)

//(2) Вывести три самых продолжительных трека (название_трека, имя_автора)
db.getCollection("tracks").aggregate([
    { $lookup: {
               from: 'users',
               localField: 'author_id',
               foreignField: '_id',
               as: 'author' }  },  
      { $unwind: '$author' },
       { $sort: { duration_secs: -1 } },
       { $limit: 3 },
        {  $project: {
               _id: 0,
               title: 1,
               author_fullname: '$author.fullname'   } }
   ])

     // #2 Results:
 //  {"title" : "Track 5",
 //   "author_fullname" : "hacker"}
   // {"title" : "Track 4",
   // "author_fullname" : "hacker"}
  //{"title" : "Track 3",
   // "author_fullname" : "hacker"} 

   // (3) Вывести две произвольные реакции (оценка_реакции, имя_трека, имя_автора)
db.getCollection("reactions").aggregate([
    { $lookup: { from: 'users',
                   localField: 'author_id',
                   foreignField: '_id',    as: 'author' }  },
             { $unwind: '$author' },
       { $lookup: { from: 'tracks',
                   localField: 'track_id',
                   foreignField: '_id',    as: 'track' }  },           
        { $unwind: '$author' },
     { $sample: { size: 2 } },
             {  $project: {
                   _id: 0,
                    value: 1 ,            
                   author_fullname: '$author.fullname'     ,     
                   title_track: '$track.title' 
                    } }
    ])
    
// #3 Results:
 //  {"value" : NumberInt(2),
 //   "author_fullname" : "hacker",
 //   "title_track" : [
  //      "Track 1" ] }
//{"value" : NumberInt(4),
 //   "author_fullname" : "Petr Ivanov",
   // "title_track" : [
   //     "Track 2" ] }


// (4) Вывести, каких реакций (оценок) больше всего 
//(допустим, чаще всего юзеры ставят оценку 5)
db.reactions.aggregate([
    { $group: {  _id: '$value' ,
            total_reactions : { $sum: '$value' } } } ,
    { $sort: { total_reactions: -1 } },
])

// #4 Results:
//{"_id" : NumberInt(5),
//    "total_reactions" : NumberInt(15)}
//{ "_id" : NumberInt(3),
 //   "total_reactions" : NumberInt(6)}
