//
//  HistoricalEvents.swift
//  ru.mirea.Pivovarov.Lesson12
//
//  Created by Никита Пивоваров on 16.11.2024.
//

import SwiftUI

struct HistoricalEvents: View {
    
    @State private var events: [HistoricalEvent] = [
        HistoricalEvent(
            title: "Первый полет человека в космос",
            date: "12 апреля 1961 года",
            description: "Советский космонавт Юрий Гагарин стал первым человеком в космосе.",
            imageURL: "https://illustrators.ru/uploads/illustration/image/1600043/main_Гагарин2021-0.jpg"
        ),
        HistoricalEvent(
            title: "Падение Берлинской стены",
            date: "9 ноября 1989 года",
            description: "Разрушение Берлинской стены стало символом окончания холодной войны.",
            imageURL: "https://img.gazeta.ru/files3/907/12576907/upload-RIAN_48540.HR-pic4_zoom-1500x1500-58226.jpg"
        ),
        HistoricalEvent(
            title: "Открытие Америки Колумбом",
            date: "12 октября 1492 года",
            description: "Христофор Колумб достиг берегов Америки.",
            imageURL: "https://upload.wikimedia.org/wikipedia/commons/9/97/Christopher_Columbus3.jpg"
        ),
        HistoricalEvent(
            title: "Начало Второй мировой войны",
            date: "1 сентября 1939 года",
            description: "Германия вторглась в Польшу, начав крупнейший конфликт XX века.",
            imageURL: "https://cdn2.red-media.ru/600x350-2019-08-700h410-3.jpg"
        ),
        HistoricalEvent(
            title: "Падение Римской империи",
            date: "4 сентября 476 года",
            description: "Конец Западной Римской империи после свержения Ромула Августула.",
            imageURL: "https://news.store.rambler.ru/img/c15e48885a82d9e1db017e1fe72b512f?img-format=auto&img-1-resize=height:400,fit:max&img-2-filter=sharpen"
        ),
        HistoricalEvent(
            title: "Изобретение печатного станка Гутенбергом",
            date: "около 1440 года",
            description: "Печатный станок произвел революцию в книгоиздании.",
            imageURL: "https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_653d433c6a06345c863cd79c_653d45bdb664022d712c8af5/scale_1200"
        ),
        HistoricalEvent(
            title: "Подписание Декларации независимости США",
            date: "4 июля 1776 года",
            description: "13 американских колоний объявили независимость от Британии.",
            imageURL: "https://39rus.org/images/murmansk/2023/Declaration_of_Independence_1819_by_John_Trumbull.jpg"
        ),
        HistoricalEvent(
            title: "Великое землетрясение в Сан-Франциско",
            date: "18 апреля 1906 года",
            description: "Землетрясение разрушило значительную часть города.",
            imageURL: "https://upload.wikimedia.org/wikipedia/commons/0/0d/Post-and-Grant-Avenue-Look.jpg"
        ),
        HistoricalEvent(
            title: "Покорение Эвереста",
            date: "29 мая 1953 года",
            description: "Эдмунд Хиллари и Тенцинг Норгей стали первыми людьми, покорившими вершину.",
            imageURL: "https://truetravel.su/upload/medialibrary/ce7/The_1953_Mount_Everest_te_012.jpg"
        ),
        HistoricalEvent(
            title: "Пожар в Лондоне",
            date: "2–5 сентября 1666 года",
            description: "Грандиозный пожар уничтожил большую часть Лондона.",
            imageURL: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Great_Fire_London.jpg"
        ),
        HistoricalEvent(
            title: "Восстание Спартака",
            date: "73–71 до н.э.",
            description: "Одно из крупнейших восстаний рабов в Древнем Риме.",
            imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Spartacus_by_Sanesi.jpg/1200px-Spartacus_by_Sanesi.jpg"
        ),
        HistoricalEvent(
            title: "Основание Великой Китайской стены",
            date: "7 век до н.э.",
            description: "Началось строительство Великой Китайской стены для защиты от набегов кочевников.",
            imageURL: "https://cdn.tripster.ru/photos/01bf7578-3c55-4e65-9aef-6e3c56bdca33.jpg"
        ),
        HistoricalEvent(
            title: "Распад СССР",
            date: "26 декабря 1991 года",
            description: "Официальный конец Советского Союза.",
            imageURL: "https://putc.org/wp-content/uploads/2018/01/0_4da73_8f398742_XL-720x340.jpg"
        ),
        HistoricalEvent(
            title: "Первая мировая война",
            date: "28 июля 1914 года – 11 ноября 1918 года",
            description: "Глобальный конфликт, в котором участвовало множество стран.",
            imageURL: "https://vsluh.ru/upload/archive/novosti/obshchestvo/b24/11-noyabrya-1918-goda-konets-pervoy-mirovoy-voyny_321915/images/8f2a95f5f5f20a1cc5ab07492e96497e.jpg"
        ),
        HistoricalEvent(
            title: "Террористическая атака 11 сентября",
            date: "11 сентября 2001 года",
            description: "Крупнейшая террористическая атака в истории США.",
            imageURL: "https://www.aa.com.tr/uploads/userFiles/d8a8c788-b9c6-4967-bb68-65a10cecec20/16%20New%20folder%2F10%20New%20folder%2F11-eylul-saldiri-1632735.jpeg"
        ),
        HistoricalEvent(
            title: "Изобретение телефона",
            date: "7 марта 1876 года",
            description: "Александр Белл запатентовал телефон.",
            imageURL: "https://images.techinsider.ru/upload/img_cache/7be/7be5410ef0dcec15927d21aa489ac996_ce_838x559x0x14.png"
        ),
        HistoricalEvent(
            title: "Полет братьев Райт",
            date: "17 декабря 1903 года",
            description: "Братья Райт совершили первый успешный полет на самолете.",
            imageURL: "https://cdn.regnum.ru/uploads/pictures/news/2017/12/15/regnum_picture_1513350576621616_normal.jpg"
        ),
        HistoricalEvent(
            title: "Крушение Титаника",
            date: "14 апреля 1912 года",
            description: "Океанский лайнер столкнулся с айсбергом и затонул.",
            imageURL: "https://img.tsargrad.tv/cache/8/5/titanik.jpg/w720h405fill.jpg"
        ),
        HistoricalEvent(
            title: "Начало Реформации",
            date: "31 октября 1517 года",
            description: "Мартин Лютер обнародовал 95 тезисов, начав Реформацию.",
            imageURL: "https://deutschonline.ru/upload/resize_cache/webp/upload/articles/luther-lasst-reformationstag.webp"
        ),
        HistoricalEvent(
            title: "Атомная бомбардировка Хиросимы",
            date: "6 августа 1945 года",
            description: "США сбросили атомную бомбу на Хиросиму.",
            imageURL: "https://opkhv.ru/files/styles/view/public/photos/2023/9373/0e9d2e31cf0e7e153637.jpg?itok=737xAokK"
        )
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(events) { event in
                    HistoricalEventView(event: event)
                    if events.last != event {
                        Divider()
                    }
                }
            }
        }
    }
}

struct HistoricalEventView: View {
    let event: HistoricalEvent
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: event.imageURL)) { image in
                if let image = image.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else {
                    Color.secondary
                        .opacity(0.75)
                        .overlay {
                            Image(systemName: "photo")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                }
            }
            .frame(width: 100, height: 100)
            .clipShape(.rect(cornerRadius: 25))
            VStack(alignment: .leading, spacing: 4) {
                Group {
                    Text(event.title)
                        .font(.headline)
                    Text(event.date)
                        .font(.system(size: 10))
                    Text(event.description)
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
    }
}

struct HistoricalEvent: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let date: String
    let description: String
    let imageURL: String
}

#Preview { HistoricalEvents() }
