//
//  BookList.swift
//  ru.mirea.Pivovarov.Lesson12
//
//  Created by Никита Пивоваров on 16.11.2024.
//

import SwiftUI

struct BookList: View {
    
    private let books: [Book] = [
        Book(author: "Джордж Оруэлл", title: "1984"),
        Book(author: "Рэй Брэдбери", title: "451 градус по Фаренгейту"),
        Book(author: "Федор Достоевский", title: "Преступление и наказание"),
        Book(author: "Лев Толстой", title: "Война и мир"),
        Book(author: "Артур Конан Дойл", title: "Шерлок Холмс"),
        Book(author: "Джоан Роулинг", title: "Гарри Поттер и философский камень"),
        Book(author: "Джон Р. Р. Толкин", title: "Властелин колец"),
        Book(author: "Марк Твен", title: "Приключения Тома Сойера"),
        Book(author: "Александр Дюма", title: "Три мушкетёра"),
        Book(author: "Джек Лондон", title: "Белый Клык"),
        Book(author: "Чарльз Диккенс", title: "Большие надежды"),
        Book(author: "Джейн Остин", title: "Гордость и предубеждение"),
        Book(author: "Мигель де Сервантес", title: "Дон Кихот"),
        Book(author: "Франц Кафка", title: "Превращение"),
        Book(author: "Эрнест Хемингуэй", title: "Старик и море"),
        Book(author: "Габриэль Гарсия Маркес", title: "Сто лет одиночества"),
        Book(author: "Герман Гессе", title: "Сиддхартха"),
        Book(author: "Михаил Булгаков", title: "Мастер и Маргарита"),
        Book(author: "Антуан де Сент-Экзюпери", title: "Маленький принц"),
        Book(author: "Виктор Гюго", title: "Отверженные"),
        Book(author: "Роберт Льюис Стивенсон", title: "Остров сокровищ"),
        Book(author: "Уильям Голдинг", title: "Повелитель мух"),
        Book(author: "Даниель Дефо", title: "Робинзон Крузо"),
        Book(author: "Эдгар Аллан По", title: "Ворон"),
        Book(author: "Джордж Мартин", title: "Игра престолов"),
        Book(author: "Владимир Набоков", title: "Лолита"),
        Book(author: "Стивен Кинг", title: "Сияние"),
        Book(author: "Харпер Ли", title: "Убить пересмешника"),
        Book(author: "Агата Кристи", title: "Убийство в Восточном экспрессе"),
        Book(author: "Орхан Памук", title: "Музей невинности"),
        Book(author: "Пауло Коэльо", title: "Алхимик"),
        Book(author: "Нил Гейман", title: "Американские боги"),
        Book(author: "Филип Пулман", title: "Темные начала"),
        Book(author: "Жюль Верн", title: "20 000 лье под водой"),
        Book(author: "Ричард Адамс", title: "Обитатели холмов"),
        Book(author: "Маргарет Этвуд", title: "Рассказ служанки"),
        Book(author: "Дуглас Адамс", title: "Автостопом по галактике"),
        Book(author: "Элизабет Гилберт", title: "Есть, молиться, любить"),
        Book(author: "Льюис Кэрролл", title: "Алиса в стране чудес"),
        Book(author: "Алексей Толстой", title: "Гиперболоид инженера Гарина")
    ]
    
    var body: some View {
        List {
            ForEach(books) { book in
                VStack {
                    Group {
                        Text(book.title)
                            .font(.headline)
                        Text(book.author)
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct Book: Identifiable {
    let id = UUID()
    let author: String
    let title: String
}


#Preview {
    BookList()
}
