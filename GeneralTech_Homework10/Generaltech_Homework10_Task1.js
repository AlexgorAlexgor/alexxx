//Main сlass: General Tech  recJMd8ieGvqjnBjX
//Описание задания.
 //1 уровень сложности: В рамках БД music написать след/запросы:


//1#  Вывести три случайных трека продолжительностью до 30 мин
db.getCollection("tracks").aggregate([
    { // фильтрация
            $match: {
                duration_secs: { $gte: 100 }
            } },
            { $sample: { size: 3 } }
    ])
    
