require 'csv'

# Import speeches from CSV
csv_file = Rails.root.join('db', 'speeches.csv')

CSV.foreach(csv_file, headers: true) do |row|
  Speech.create!(
    theme: row['Theme'],
    speaker: row['Speaker'],
    date: DateTime.parse(row['Date'])
  )
end

puts "✅ Speeches imported successfully!"

Book.destroy_all

Book.create!([
  {
    position: 1,
    current: false,
    title: "Jesus e Atualidade",
    subtitle: "Jesus and Modernity",
    description: "A atualidade do pensamento de Jesus surpreende os mais céticos estudiosos da problemática humana, sempre complexa e desafiadora nestes dias. A Veneranda Benfeitora apresenta, neste pequeno grande livro, vinte situações que abordam as ocorrências do cotidiano que aturdem a civilização, buscando respostas da conduta na terapia de Jesus, cujos resultados, obviamente, são a saúde, a paz e a felicidade como experiências ainda não fruídas individualmente e coletivamente pelos homens."
  },
  {
    position: 2,
    current: true,
    title: "O Homem Integral",
    subtitle: "The Integral Man",
    description: "Neste extraordinário ensaio, a Veneranda Joanna de Ângelis, através da psicografia análise de todos os aspectos filosóficos e psicológicos que ocorrem para a complexa formação do Homem Integral, abordando-os do ponto de vista da Psicologia espírita."
  },
  {
    position: 3,
    current: false,
    title: "Plenitude",
    subtitle: "Plenitude",
    description: "A Autora espiritual faz uma profunda análise psicológica dos aspectos do sofrimento, propondo a solução espírita, convidativa ao Autodescobrimento, à vivência evangélica e ao comportamento lúcido, requisitos essenciais para a conquista da plenitude."
  },
  {
    position: 4,
    current: false,
    title: "Momentos de Saúde e de Consciência",
    subtitle: "Moments of Health and Consciousness",
    description: "A conquista da saúde integral é a meta ambicionada pela criatura humana. Conseguir a harmonia entre o equilíbrio orgânico, e o emocional e o psíquico, num quadro geral de bem-estar, constitui um grande desafio para a inteligência humana que, milenarmente, vem recorrendo às mais variadas quão complexas experiências, que têm resultado em admiráveis e valiosas conquistas."
  },
  {
    position: 5,
    current: false,
    title: "O Ser Consciente",
    subtitle: "The Conscious Being",
    description: "Este modesto livro, que hora trazemos à análise do caro leitor, pretende, sem presunção, auxiliá-lo na conquista da consciência. Não apresenta qualquer técnica nova ou milagrosa. Estuda algumas problemáticas humanas à luz da Quarta Força em Psicologia, colocando uma ponte na direção da Doutrina Espírita, que é portadora de uma visão profunda e integral do ser.\""
  },
  {
    position: 6,
    current: false,
    title: "Autodescobrimento",
    subtitle: "Self-Discovery",
    description: "Ao apresentarmos o nosso livro aos interessados na decifração de si mesmos, tentamos colocar pontes entre os mecanismos das psicologias Humanistas e Transpessoal com a Doutrina Espírita, que as ilumina e completa, assim cooperando de alguma forma com aqueles que se empenham na busca interior, no autodescobrimento.\" - Joanna de Ângelis"
  },
  {
    position: 7,
    current: false,
    title: "Desperte e Seja Feliz",
    subtitle: "Awaken and Be Happy",
    description: "O homem e a mulher contemporâneos, seduzidos pelas ambições desmedidas do poder que lhes propicia luxo, lazer e gozos, permanecem adormecidos para as graves responsabilidades espirituais. Considerando-se de secundária importância, na vã suposição de que podem remediar a situação íntima a qualquer instante, transferem o pensamento e a emoção para o exterior, com grandes prejuízos de harmonia interna.\" - Joanna de Ângelis"
  },
  {
    position: 8,
    current: false,
    title: "Vida: Desafios e Soluções",
    subtitle: "Life: Challenges and Solutions",
    description: "A mensageira da Imortalidade oferece, em linguagem simples e acessível, estudos dos problemas humanos à luz da Psicologia Espírita com os subsídios da Psicologia Transpessoal, a fim de minorar os problemas e dificuldades da existência corporal, preparando o Espírito para a sua destinação futura."
  },
  {
    position: 9,
    current: false,
    title: "Amor, Imbatível Amor",
    subtitle: "Love, Unbeatable Love",
    description: "Nesta obra magistral da Série Psicológica, que deu início a uma nova linguagem espírita, a benfeitora Joanna de Ângelis examina várias psicopatologias e conflitos hodiernos, estabelecendo uma ponte espiritual entre as terapias de admiráveis especialistas e o Amor. Nela são abordados temas de profundo interesse para as criaturas, sob várias angulações, que culminam com a visão espírita libertadora e ideal."
  },
  {
    position: 10,
    current: false,
    title: "O Despertar do Espírito",
    subtitle: "The Awakening of the Spirit",
    description: "A benfeitora espiritual Joanna de Ângelis traz, para estudo e meditação, mais uma Obra de sua Série Psicológica. O Despertar do Espírito, como o título diz, é um aprofundado estudo do ser existencial sobrevivente ao túmulo e anterior ao berço, passando pelas diversas etapas das experiências humanas durante a reencarnação."
  },
  {
    position: 11,
    current: false,
    title: "Jesus e o Evangelho",
    subtitle: "Jesus and the Gospel",
    description: "Muito já se disse e se escreveu sobre Jesus e o Evangelho. O nobre Espírito Joanna de Ângelis, através da mediunidade de Divaldo Franco, celebrando os dois mil anos do Seu nascimento, fez um oportuno estudo à luz da psicologia profunda sobre a Sua vida e Sua mensagem na magnífica Obra que estamos oferecendo ao caro Leitor."
  },
  {
    position: 12,
    current: false,
    title: "Triunfo Pessoal",
    subtitle: "Personal Triumph",
    description: "Centrando-se na notável contribuição de Jung, a autora introduz o pensamento de experientes psiquiatras, psicanalistas, biólogos, a fim de demonstrar que na raiz de todo e qualquer transtorno, aflição, enfermidade ou sofrimento, encontra-se o Espírito eterno, responsável pelas ocorrências que podem ser utilizadas para seu reequilíbrio, a sua recuperação, a sua paz."
  },
  {
    position: 13,
    current: false,
    title: "Conflitos Existenciais",
    subtitle: "Existential Conflicts",
    description: "No estilo inconfundível, o Nobre Espírito Joanna de Ângelis apresenta-nos, Conflitos Existenciais, resumindo 'vários comportamentos perturbadores que se apresentam testes de resistência para o indivíduo humano', enfocados á luz da psicologia, da psicanálise e da psiquiatria, sob o prisma, porém, da Doutrina Espírita."
  },
  {
    position: 14,
    current: false,
    title: "Encontro com a Paz e a Saúde",
    subtitle: "Meeting with Peace and Health",
    description: "Numa admirável lucidez e argumentação ímpar, pela psicografia de Divaldo Franco, a Veneranda Joanna de Ângelis reitera inequivocamente os seus profundos conhecimentos de Psicologia Transpessoal, desfiando um rosário de nuanças da alma humana, dissecando-lhe os sentimentos e as profundas transformações pelas quais passa o ser, desde os primórdios da sua existência na Terra, até os dias atuais."
  },
  {
    position: 15,
    current: false,
    title: "Em Busca da Verdade",
    subtitle: "In Search of Truth",
    description: "A venerada Joanna de Ângelis oferece-nos EM BUSCA DA VERDADE, mais uma extraordinária Obra com profundas lições que nos levam por diretrizes seguras, para alcançarmos a maturidade psicológica - de que tanto necessitamos - a fim de libertar o nosso Espírito das densas camadas que dificultam a sua longa jornada na difícil marcha da evolução."
  },
  {
    position: 16,
    current: false,
    title: "Psicologia da Gratidão",
    subtitle: "Psychology of Gratitude",
    description: "A PSICOLOGIA DA GRATIDÃO torna-se um instrumento hábil no eixo ego-self, devendo ser vivenciada em todos os momentos da existência corporal como roteiro de segurança para a conquista da sua realidade. Filha do amadurecimento psicológico, enriquece de paz e de alegria todo aquele que a cultiva."
  }
])

puts "📚 Books seeded successfully!"

# Seed services
puts "🌱 Seeding Services..."

services_data = [
  {
    slug: "study-group",
    title: "Study Group",
    description: "Engage in discussions on the works of Joanna de Ângelis for self-discovery and transformation.",
    full_description: "Engage in weekly studies of Joanna de Ângelis' teachings and Spiritist psychology for self-discovery and transformation.",
    icon: "fas fa-book-open",
    color: "#a3c9f1"
  },
  {
    slug: "energy-healing",
    title: "Energy Healing",
    description: "Experience spiritual renewal and balance through the laying on of hands.",
    full_description: "According to Spiritism, diseases and imbalances originate in the spiritual body, also known as the perispirit, which is the subtle envelope that connects the spirit to the physical body. According to the teachings of Allan Kardec and other Spiritist authors, physical ailments often reflect disturbances in the spiritual body, which in turn can be influenced by negative thoughts, emotions, and unbalanced behaviors of the individual. When the perispirit is misaligned or out of balance due to negative feelings, past traumas, or wrongful actions, these imbalances can manifest in the physical body, resulting in illnesses or emotional problems. Additionally, the perispirit can be influenced by spiritual entities, which may act either positively or negatively, depending on the individual’s spiritual and moral state. Energy Healing is directly connected to this concept. In Energy Healing, the medium, with the help of higher spirits, transmits healing energy that works on the individual’s perispirit, promoting harmonization and restoring spiritual balance. As the perispirit is the link between the physical body and the spirit, balancing it can help improve the emotional and physical state of the person, preventing or alleviating symptoms that have their origins in spiritual disharmony. Thus, Energy Healing is a tool to restore energetic and spiritual balance, which in turn positively affects the individual's physical and emotional health.",
    icon: "fas fa-star-and-crescent",
    color: "#dcd6f7"
  },
  {
    slug: "childrens-and-youth-group",
    title: "Children’s and Youth Group",
    description: "A space for young people to learn Spiritist values through engaging activities.",
    full_description: "Our Children’s and Youth Group meets weekly to engage young people in Spiritist teachings through dynamic and age-appropriate activities. We explore values like kindness, respect, and cooperation using stories, games, and conversations that connect spiritual concepts with everyday life. Through shared experiences, children and teens develop a sense of community, spiritual identity, and tools for inner growth that stay with them for life. Parents are welcome to engage and support their children’s development in a safe, welcoming environment.",
    icon: "fas fa-children",
    color: "#fbc4ab"
  },
  {
    slug: "lecture",
    title: "Lecture",
    description: "Attend lectures that explore Spiritist philosophy and its applications in daily life.",
    full_description: "Spiritist lectures are weekly moments of reflection and learning, open to everyone, aiming to provide moral and spiritual guidance through the teachings of Spiritism. These talks explore diverse topics based on the Gospel According to Spiritism and other Spiritist works, encouraging attendees to develop self-awareness, inner peace, and a deeper connection to the spiritual world. During the lectures, speakers from our centre or invited guests present Spiritist principles applied to daily life, helping participants navigate life’s challenges with clarity and compassion. The atmosphere is one of respect, serenity, and reflection. Lectures are held every Monday evening at the L&P centre and are free to attend.",
    icon: "fas fa-microphone",
    color: "#ffeaa7"
  },
  {
    slug: "library",
    title: "Library",
    description: "Explore our collection of Spiritist books and resources.",
    full_description: "Explore our Spiritist library and access trusted external resources. Visit our website for links to Kardecpedia, SS Baltimore, and BV Espírita.",
    icon: "fas fa-book-reader",
    color: "#ffeaa7"
  },
  {
    slug: "fraternal-assistance",
    title: "Fraternal Assistance",
    description: "Receive emotional and spiritual support through private conversations.",
    full_description: "Fraternal Assistance is a Spiritist practice of spiritual support and aid, with the main objective of offering comfort, guidance, and emotional help to assisted persons who seek relief for their difficulties, whether they are material, emotional, or spiritual. This assistance is provided in a welcoming manner, with great respect and care, aiming to help the assisted person understand their situations, always with the intention of supporting them in overcoming challenges and fostering moral and spiritual growth. In Fraternal Assistance, the assisted persons are listened to without judgment and receive guidance based on the principles of Spiritism, with an emphasis on self-awareness, strengthening faith, and understanding the spiritual laws that govern life. The assistance takes place confidentially within the L&P premises and is conducted by volunteer workers from the Spiritist Centre. Moreover, Fraternal Assistance does not involve any form of religious or spiritual imposition, serving as a moment of empathetic listening and the exchange of positive energy, focused on promoting inner peace and emotional and spiritual rebalancing for the assisted person. If you wish to schedule a Fraternal Assistance, simply fill out the booking request on our website. One of the responsible coordinators for our Fraternal Assistance service will contact you shortly to confirm your appointment.",
    icon: "fas fa-hand-holding-heart",
    color: "#f8c291"
  },
  {
    slug: "gospel-at-home",
    title: "Gospel at Home - Spiritual Support",
    description: "Spiritual support held at home, offered by appointment.",
    full_description: "Gospel at Home is a Spiritist practice aimed at promoting spiritual harmony and strengthening family bonds through the reflection on the teachings of Jesus Christ, found in the Gospel According to Spiritism. Held within the home, this moment of study and prayer seeks to create an atmosphere of peace and balance, dispelling negative energies and fostering the moral development of participants. Our centre offers the Gospel at Home support for those interested in practicing this ritual in their residence. The service, which is free of charge, lasts 30 to 40 minutes at most, and requires no special reception from the hosts. The only request is that there be available water for fluidification, to be consumed by the household members during or after the session. If you wish to schedule Gospel at Home in your house, simply fill out the booking request on our website. One of the responsible coordinators for our Gospel at Home service will contact you shortly to confirm your appointment.",
    icon: "fas fa-house",
    color: "#f97316"
  }
]

services_data.each do |data|
  service = Service.find_or_initialize_by(title: data[:title])
  service.assign_attributes(data.except(:slug)) # preserve original slug
  service.slug ||= data[:slug] # only assign slug if it's a new record
  service.save!
end
puts "✅ Services seeded successfully!"

# Seed events
CentreEvent.destroy_all

# CentreEvent.create!([
#   {
#     title: "Intro to Spiritism",
#     date: "Thursday, April 10, 2025 – 7:00 PM",
#     description: "An open session to introduce newcomers to Spiritist teachings. All are welcome.",
#     location: "Spiritist Centre, 38 Palmerston Rd, Unley SA",
#     icon: "fas fa-calendar-days"
#   },
#   {
#     title: "Mediumship Development Workshop",
#     date: "Saturday, May 3, 2025 – 10:00 AM to 2:00 PM",
#     description: "A guided workshop focused on mediumship practices and ethical development.",
#     location: "Spiritist Centre, 38 Palmerston Rd, Unley SA",
#     icon: "fas fa-hands-asl-interpreting"
#   }
# ])

puts "✅ Events seeded successfully!"

AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end if Rails.env.development?
