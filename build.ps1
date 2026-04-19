$base = Get-Content "index-template.html" -Raw

function Write-LangFile {
    param(
        [string]$LangCode,
        [string]$LangName,
        [hashtable]$Map,
        [string]$OutFile
    )
    $content = $base -replace 'lang="zh-SG"', ('lang="' + $LangCode + '"')
    
    # Replace button text
    $content = $content -replace '<button class="lang-btn"><i class="fa-solid fa-globe"></i> 中文 <i', 
                                ('<button class="lang-btn"><i class="fa-solid fa-globe"></i> ' + $LangName + ' <i')
    
    # Sort keys by length to avoid partial matches
    $keys = $Map.Keys | Sort-Object Length -Descending
    foreach ($k in $keys) {
        $content = $content.Replace($k, $Map[$k])
    }
    
    Set-Content -Path $OutFile -Value $content -Encoding UTF8
    Write-Host "Created $OutFile"
}

# 1. English
$enMap = @{
    "ULC Professionals Club | 跨国商务人士成长" = "ULC Professionals Club | Growth for Professionals";
    "专为跨国商务人士打造的成长型课程项目。这是一次对自己成长的投资，对自己视野的拓展。" = "A growth-oriented course program designed for transnational professionals. It's an investment in your growth and an expansion of your horizons.";
    "核心优势" = "Core Advantages";
    "课程详情" = "Course Details";
    "适合人群" = "Target Audience";
    "立即报名" = "Sign Up";
    "这是一次对自己成长的投资，这是一次对自己视野的拓展" = "An investment in your growth, an expansion of your horizons";
    "专为跨国商务人士打造的 " = "A ";
    " 课程项目" = " Program for Professionals";
    "这不只是英语学习，更是一个帮助你走进真实新加坡商务与社交圈的成长机会。" = "More than just English learning, it's an opportunity to step into real Singapore business and social circles.";
    "个月时长" = "Months Duration";
    "次精品课程" = "Premium Sessions";
    "真实社交融入" = "Real Social Integration";
    "了解详情及费用" = "Learn More & Pricing";
    "课程核心优势" = "Core Course Advantages";
    "独创的教学与实战结合模式，助你全方位提升跨国商务能力。" = "An original model combining teaching and practical application to comprehensively elevate your transnational business skills.";
    "沉浸式商业场域" = "Immersive Business Environment";
    "在3个月、20次的多国家学员学习互动中，精准模拟真实商务与社交环境，让成长在实战中自然发生。(Immersive Practice)" = "Through 3 months and 20 sessions with multinational students, we simulate real business and social environments, allowing natural growth. (Immersive Practice)";
    "结果导向型交付" = "Result-Oriented Delivery";
    "坚持“每课必有产出”。通过可视化的成果转换 (Visible Output)，确保从理论输入到实操运用的无缝衔接。(Result-Oriented Delivery)" = "We insist on 'visible output for every lesson', ensuring a seamless transition from theoretical input to practical application. (Result-Oriented Delivery)";
    "深度本地化解码" = "Deep Local Integration";
    "专为非母语人士定制。不仅是语言的进阶，更是对新加坡规则与社交逻辑的深度拆解，助你跨越文化隔阂。(Deep Local Integration)" = "Customized for non-native speakers. A deep breakdown of Singapore's rules and social logic to cross cultural barriers. (Deep Local Integration)";
    "跨文化深度链接" = "Cross-Cultural Connection";
    "在多国背景的圈层中，建立能够共鸣、互信的高质量商业人脉网络，拓展国际化视野。(Cross-Cultural Connection)" = "Build a high-quality, trustworthy business network in a multinational circle, expanding your international perspective. (Cross-Cultural Connection)";
    "开课时间：" = "Start Date:";
    "2026年4月21日 - 6月25日" = "Apr 21 - Jun 25, 2026";
    "上课频次：" = "Frequency:";
    "每周二、周四上课 (晚上 7:00 - 9:00)" = "Every Tue & Thu (7:00 PM - 9:00 PM)";
    "课程总量：" = "Total Sessions:";
    "共 20 节课程" = "20 Sessions";
    "教学模式：" = "Teaching Mode:";
    "以讨论式教学为主，结合真实场景与引导式交流" = "Discussion-based teaching, combined with real scenarios and guided communication.";
    "三个月进阶路径清晰" = "Clear 3-Month Progression Path";
    "个人成长数字档案" = "Digital Growth Profile";
    "商业实战挑战赛" = "Real Business Challenge";
    "模块化技能产出" = "Modular Skill Output";
    "菁英结业荣誉包" = "Elite Graduation Kit";
    "关键收获" = "Key Outcomes";
    "三个月后，你将实现蜕变" = "In 3 months, you will transform.";
    "英文表达重塑" = "English Expression Reshaped";
    "彻底克服心理障碍，实现从恐惧开口到“流利开口”的转变。(Confidence)" = "Overcome psychological barriers and transition from fear of speaking to fluent communication. (Confidence)";
    "行动转化" = "Action Conversion";
    "学会不仅在现场聊得来，更能持续维系高价值关系。(Action)" = "Learn to consistently maintain high-value relationships. (Action)";
    "顺畅融入" = "Smooth Integration";
    "掌握狮城沟通底色，实现文化丝滑嵌入，本地游刃有余。(Integration)" = "Master communication fundamentals in Singapore for seamless cultural integration. (Integration)";
    "归属共鸣" = "Sense of Belonging";
    "加入志同道合全球社群，拥有长期的支持系统。(Belonging)" = "Join a global community of like-minded individuals with long-term support. (Belonging)";
    "课程适合谁？" = "Target Audience?";
    "五大基础场景 (初级)" = "5 Basic Scenarios";
    "五大进阶场景 (中级)" = "5 Advanced Scenarios";
    "会议沟通不顺畅，难以清晰表达观点" = "Unsmooth meeting communication, struggling to clearly express viewpoints.";
    "邮件写作不够专业，影响职场形象" = "Unprofessional email writing affecting workplace image.";
    "面对电话沟通时缺乏信心" = "Lack of confidence when communicating over the phone.";
    "在社交聚会中不知如何自然展开对话" = "Not knowing how to naturally start conversations in social gatherings.";
    "演讲与汇报表现单一，缺乏吸引力" = "Monotonous speeches and presentations lacking appeal.";
    "跨文化交流中容易产生沟通误差" = "Easy to have communication errors in cross-cultural exchanges.";
    "商务谈判中的表达力度与说服力不足" = "Lack of expressive power and persuasiveness in business negotiations.";
    "团队合作场景下的沟通协同有待提升" = "Communication and collaboration in teamwork scenarios need improvement.";
    "品牌叙事与价值传达能力较弱" = "Weak brand storytelling and value communication skills.";
    "正式商务场合中的回应不够准确得体" = "Inaccurate or inappropriate responses in formal business settings.";
    "不止于课堂" = "Beyond the Classroom";
    "除了商务课程，我们每月还会安排" = "Besides business courses, we arrange";
    " 场精选活动" = " curated events every month";
    "行业分享会" = "Industry Sharing";
    "本地专业人士为您带来一手的行业洞察。" = "Local professionals bring you firsthand industry insights.";
    "商务社交与人脉拓展" = "Business Networking";
    "轻松愉悦的环境中结识更多商业伙伴。" = "Meet more business partners in a relaxed and pleasant environment.";
    "真实场景体验" = "Real Scenario Experience";
    "走进新加坡真实商业与社交场景，提升实际沟通能力。" = "Step into real business and social scenarios in Singapore to enhance practical communication skills.";
    "准备好开启您的成长之旅了吗？" = "Ready to Start Your Growth Journey?";
    "抓住在这个多元且国际化的商业环境中脱颖惊而出的机会。" = "Seize the opportunity to stand out in this diverse and international business environment.";
    "抓住在这个多元且国际化的商业环境中脱颖而出的机会。" = "Seize the opportunity to stand out in this diverse and international business environment.";
    "课程费用" = "Course Fee";
    "时长：3个月 (20次精品课)" = "Duration: 3 Months (20 Premium Sessions)";
    "报名咨询 / 立即加入" = "Consultation / Join Now";
    "United Language Centre" = "United Language Centre";
    "成长型" = "Growth-Oriented"
}
Write-LangFile -LangCode "en" -LangName "English" -Map $enMap -OutFile "index.html"

# 2. Italian
$itMap = @{
    "ULC Professionals Club | 跨国商务人士成长" = "ULC Professionals Club | Crescita per Professionisti";
    "专为跨国商务人士打造的成长型课程项目。这是一次对自己成长的投资，对自己视野的拓展。" = "Un programma di crescita per professionisti internazionali. Un investimento su te stesso e un'espansione dei tuoi orizzonti.";
    "核心优势" = "Vantaggi Principali";
    "课程详情" = "Dettagli del Corso";
    "适合人群" = "Destinatari";
    "立即报名" = "Iscriviti Ora";
    "这是一次对自己成长的投资，这是一次对自己视野的拓展" = "Un investimento sulla tua crescita, un'espansione dei tuoi orizzonti";
    "专为跨国商务人士打造的 " = "Un Programma per ";
    " 课程项目" = " Professionisti Internazionali";
    "这不只是英语学习，更是一个帮助你走进真实新加坡商务与社交圈的成长机会。" = "Non solo inglese, ma un'opportunità per entrare nei veri circoli d'affari e sociali di Singapore.";
    "个月时长" = "Mesi";
    "次精品课程" = "Sessioni Premium";
    "真实社交融入" = "Vera Integrazione Sociale";
    "了解详情及费用" = "Scopri di più e Prezzi";
    "课程核心优势" = "Vantaggi Principali del Corso";
    "独创的教学与实战结合模式，助你全方位提升跨国商务能力。" = "Un modello originale che unisce insegnamento e pratica per migliorare le tue competenze aziendali a livello globale.";
    "沉浸式商业场域" = "Ambiente Aziendale Immersivo";
    "在3个月、20次的多国家学员学习互动中，精准模拟真实商务与社交环境，让成长在实战中自然发生。(Immersive Practice)" = "Simuliamo ambienti d'affari reali attraverso l'interazione con studenti internazionali. (Immersive Practice)";
    "结果导向型交付" = "Orientamento ai Risultati";
    "坚持“每课必有产出”。通过可视化的成果转换 (Visible Output)，确保从理论输入到实操运用的无缝衔接。(Result-Oriented Delivery)" = "Garantiamo un output visibile in ogni lezione, per passare dalla teoria alla pratica senza sforzo. (Result-Oriented Delivery)";
    "深度本地化解码" = "Profonda Integrazione Locale";
    "专为非母语人士定制。不仅是语言的进阶，更是对新加坡规则与社交逻辑的深度拆解，助你跨越文化隔阂。(Deep Local Integration)" = "Pensato per chi non è madrelingua per decodificare la cultura e superare le barriere a Singapore. (Deep Local Integration)";
    "跨文化深度链接" = "Connessione Interculturale";
    "在多国背景的圈层中，建立能够共鸣、互信的高质量商业人脉网络，拓展国际化视野。(Cross-Cultural Connection)" = "Costruisci reti commerciali di fiducia in un contesto interculturale. (Cross-Cultural Connection)";
    "开课时间：" = "Data di Inizio:";
    "2026年4月21日 - 6月25日" = "21 Apr - 25 Giu 2026";
    "上课频次：" = "Frequenza:";
    "每周二、周四上课 (晚上 7:00 - 9:00)" = "Ogni Mar e Gio (19:00 - 21:00)";
    "课程总量：" = "Totale Sessioni:";
    "共 20 节课程" = "20 Sessioni";
    "教学模式：" = "Modalità di Insegnamento:";
    "以讨论式教学为主，结合真实场景与引导式交流" = "Insegnamento basato sulla discussione con scenari reali e interazioni guidate.";
    "三个月进阶路径清晰" = "Percorso di Crescita di 3 Mesi";
    "个人成长数字档案" = "Profilo di Crescita Digitale";
    "商业实战挑战赛" = "Sfida Aziendale Reale";
    "模块化技能产出" = "Output di Competenze";
    "菁英结业荣誉包" = "Kit di Diploma d'Élite";
    "关键收获" = "Risultati Chiave";
    "三个月后，你将实现蜕变" = "In 3 mesi, raggiungerai una trasformazione.";
    "英文表达重塑" = "Rimodellazione dell'Inglese";
    "彻底克服心理障碍，实现从恐惧开口到“流利开口”的转变。(Confidence)" = "Supera la paura di parlare e diventa fluente. (Confidence)";
    "行动转化" = "Traduzione in Azione";
    "学会不仅在现场聊得来，更能持续维系高价值关系。(Action)" = "Impara a mantenere relazioni di alto valore a lungo termine. (Action)";
    "顺畅融入" = "Integrazione Fluida";
    "掌握狮城沟通底色，实现文化丝滑嵌入，本地游刃有余。(Integration)" = "Padroneggia la comunicazione locale a Singapore. (Integration)";
    "归属共鸣" = "Senso di Appartenenza";
    "加入志同道合全球社群，拥有长期的支持系统。(Belonging)" = "Unisciti a una comunità globale per un supporto continuo. (Belonging)";
    "课程适合谁？" = "Per Chì È Il Corso?";
    "五大基础场景 (初级)" = "5 Scenari di Base";
    "五大进阶场景 (中级)" = "5 Scenari Avanzati";
    "会议沟通不顺畅，难以清晰表达观点" = "Difficoltà nell'esprimere chiaramente le opinioni durante le riunioni.";
    "邮件写作不够专业，影响职场形象" = "Scrittura di e-mail non professionale che compromette l'immagine.";
    "面对电话沟通时缺乏信心" = "Mancanza di fiducia nelle comunicazioni telefoniche.";
    "在社交聚会中不知如何自然展开对话" = "Non sapere come conversare naturalmente agli eventi sociali.";
    "演讲与汇报表现单一，缺乏吸引力" = "Presentazioni monotone e prive di attrattiva.";
    "跨文化交流中容易产生沟通误差" = "Frequenti malintesi nelle comunicazioni interculturali.";
    "商务谈判中的表达力度与说服力不足" = "Assenza di persuasione e forza espressiva nelle negoziazioni.";
    "团队合作场景下的沟通协同有待提升" = "Necessità di migliorare collaborazione e interazione nel lavoro di squadra.";
    "品牌叙事与价值传达能力较弱" = "Poca abilità nel trasmettere il valore del brand e storytelling.";
    "正式商务场合中的回应不够准确得体" = "Risposte inadeguate in contesti aziendali formali.";
    "不止于课堂" = "Oltre la Classe";
    "除了商务课程，我们每月还会安排" = "Oltre ai corsi aziendali, organizziamo";
    " 场精选活动" = " eventi selezionati al mese";
    "行业分享会" = "Condivisione Settoriale";
    "本地专业人士为您带来一手的行业洞察。" = "I professionisti locali offrono approfondimenti diretti.";
    "商务社交与人脉拓展" = "Networking Aziendale";
    "轻松愉悦的环境中结识更多商业伙伴。" = "Incontra partner d'affari in un ambiente rilassato.";
    "真实场景体验" = "Esperienza Scenari Reali";
    "走进新加坡真实商业与社交场景，提升实际沟通能力。" = "Entra nel vivo del business a Singapore per migliorare la comunicazione pratica.";
    "准备好开启您的成长之旅了吗？" = "Pronto per il tuo viaggio di crescita?";
    "抓住在这个多元且国际化的商业环境中脱颖惊而出的机会。" = "Cogli l'opportunità di distinguerti in un ambiente interculturale.";
    "抓住在这个多元且国际化的商业环境中脱颖而出的机会。" = "Cogli l'opportunità di distinguerti in questo ecosistema dinamico.";
    "课程费用" = "Costo del Corso";
    "时长：3个月 (20次精品课)" = "Durata: 3 Mesi (20 Sessioni)";
    "报名咨询 / 立即加入" = "Richiedi Info / Iscriviti Ora";
    "成长型" = "Crescita"
}
Write-LangFile -LangCode "it" -LangName "Italiano" -Map $itMap -OutFile "index-it.html"

# 3. German
$deMap = @{
    "ULC Professionals Club | 跨国商务人士成长" = "ULC Professionals Club | Wachstum für Profis";
    "专为跨国商务人士打造的成长型课程项目。这是一次对自己成长的投资，对自己视野的拓展。" = "Ein wachstumsorientiertes Programm für internationale Geschäftsleute. Eine Investition in Sie selbst und Ihre Perspektiven.";
    "核心优势" = "Kernvorteile";
    "课程详情" = "Kursdetails";
    "适合人群" = "Zielgruppe";
    "立即报名" = "Jetzt anmelden";
    "这是一次对自己成长的投资，这是一次对自己视野的拓展" = "Eine Investition in Ihre Entwicklung";
    "专为跨国商务人士打造的 " = "Ein ";
    " 课程项目" = " Programm für Profis";
    "这不只是英语学习，更是一个帮助你走进真实新加坡商务与社交圈的成长机会。" = "Nicht nur Englischlernen, sondern auch ein Einstieg in Singapurs reale Geschäftskreise.";
    "个月时长" = "Monate";
    "次精品课程" = "Premium-Sitzungen";
    "真实社交融入" = "Echte soziale Integration";
    "了解详情及费用" = "Mehr erfahren & Preise";
    "课程核心优势" = "Zentrale Kursvorteile";
    "独创的教学与实战结合模式，助你全方位提升跨国商务能力。" = "Ein exklusives Modell aus Theorie und Praxis, um Ihre internationalen Geschäftskompetenzen zu steigern.";
    "沉浸式商业场域" = "Immersives Geschäftsumfeld";
    "在3个月、20次的多国家学员学习互动中，精准模拟真实商务与社交环境，让成长在实战中自然发生。(Immersive Practice)" = "Wir simulieren reale Geschäftsszenarien in internationalen Gruppen für ein schnelles Wachstum. (Immersive Practice)";
    "结果导向型交付" = "Ergebnisorientierter Ansatz";
    "坚持“每课必有产出”。通过可视化的成果转换 (Visible Output)，确保从理论输入到实操运用的无缝衔接。(Result-Oriented Delivery)" = "Sichtbarer Output in jeder Sitzung für einen nahtlosen Übergang von Theorie zur Praxis. (Result-Oriented Delivery)";
    "深度本地化解码" = "Lokale Integration";
    "专为非母语人士定制。不仅是语言的进阶，更是对新加坡规则与社交逻辑的深度拆解，助你跨越文化隔阂。(Deep Local Integration)" = "Speziell für Nicht-Muttersprachler, um Singapurs Regeln und Kultur zu meistern. (Deep Local Integration)";
    "跨文化深度链接" = "Interkulturelle Vernetzung";
    "在多国背景的圈层中，建立能够共鸣、互信的高质量商业人脉网络，拓展国际化视野。(Cross-Cultural Connection)" = "Bauen Sie ein starkes internationales Netzwerk auf. (Cross-Cultural Connection)";
    "开课时间：" = "Startdatum:";
    "2026年4月21日 - 6月25日" = "21. Apr. - 25. Jun. 2026";
    "上课频次：" = "Häufigkeit:";
    "每周二、周四上课 (晚上 7:00 - 9:00)" = "Di und Do (19:00 - 21:00)";
    "课程总量：" = "Anzahl der Sitzungen:";
    "共 20 节课程" = "20 Sitzungen";
    "教学模式：" = "Lehrmethode:";
    "以讨论式教学为主，结合真实场景与引导式交流" = "Diskussionsbasiert, mit echten Szenarien und angeleitetem Austausch.";
    "三个月进阶路径清晰" = "Klarer 3-Monats-Pfad";
    "个人成长数字档案" = "Digitales Profil";
    "商业实战挑战赛" = "Reale Business-Challenge";
    "模块化技能产出" = "Sichtbare Ergebnisse";
    "菁英结业荣誉包" = "Elite-Zertifikatskit";
    "关键收获" = "Wichtigste Ziele";
    "三个月后，你将实现蜕变" = "In 3 Monaten werden Sie sich transformieren.";
    "英文表达重塑" = "Neuerfindung des Englischs";
    "彻底克服心理障碍，实现从恐惧开口到“流利开口”的转变。(Confidence)" = "Überwinden Sie Sprachängste und gewinnen Sie Sicherheit. (Confidence)";
    "行动转化" = "Aktion";
    "学会不仅在现场聊得来，更能持续维系高价值关系。(Action)" = "Lernen Sie, langfristige wertvolle Beziehungen zu pflegen. (Action)";
    "顺畅融入" = "Nahtlose Integration";
    "掌握狮城沟通底色，实现文化丝滑嵌入，本地游刃有余。(Integration)" = "Meistern Sie Singapurs Kommunikationsregeln reibungslos. (Integration)";
    "归属共鸣" = "Zugehörigkeitsgefühl";
    "加入志同道合全球社群，拥有长期的支持系统。(Belonging)" = "Treten Sie einer globalen unterstützenden Community bei. (Belonging)";
    "课程适合谁？" = "Zielgruppe des Kurses";
    "五大基础场景 (初级)" = "5 grundlegende Szenarien";
    "五大进阶场景 (中级)" = "5 fortgeschrittene Szenarien";
    "会议沟通不顺畅，难以清晰表达观点" = "Probleme bei der Artikulation in Meetings.";
    "邮件写作不够专业，影响职场形象" = "Unprofessionelle E-Mails, die das Image beeinträchtigen.";
    "面对电话沟通时缺乏信心" = "Mangelndes Vertrauen bei Telefongesprächen.";
    "在社交聚会中不知如何自然展开对话" = "Unsicherheit beim Starten von Gesprächen auf Netzwerktreffen.";
    "演讲与汇报表现单一，缺乏吸引力" = "Monotone und wenig überzeugende Präsentationen.";
    "跨文化交流中容易产生沟通误差" = "Fehlkommunikation durch interkulturelle Missverständnisse.";
    "商务谈判中的表达力度与说服力不足" = "Schwache Überzeugungskraft in Geschäftsverhandlungen.";
    "团队合作场景下的沟通协同有待提升" = "Verbesserungsbedarf bei Zusammenarbeit und Kommunikation.";
    "品牌叙事与价值传达能力较弱" = "Schwächen in Marken-Storytelling und Wertvermittlung.";
    "正式商务场合中的回应不够准确得体" = "Unangemessene Reaktionen bei formellen Geschäftsereignissen.";
    "不止于课堂" = "Mehr als nur Unterricht";
    "除了商务课程，我们每月还会安排" = "Darüber hinaus bieten wir monatlich";
    " 场精选活动" = " ausgewählte Events:";
    "行业分享会" = "Branchen-Insights";
    "本地专业人士为您带来一手的行业洞察。" = "Lokale Experten teilen aktuelles Branchenwissen.";
    "商务社交与人脉拓展" = "Business Networking";
    "轻松愉悦的环境中结识更多商业伙伴。" = "Treffen Sie Partner in entspannter Atmosphäre.";
    "真实场景体验" = "Echte Szenarienerprobung";
    "走进新加坡真实商业与社交场景，提升实际沟通能力。" = "Praktische Kommunikation in Singapurs realer Geschäftswelt.";
    "准备好开启您的成长之旅了吗？" = "Bereit für Ihre persönliche Entwicklung?";
    "抓住在这个多元且国际化的商业环境中脱颖惊而出的机会。" = "Nutzen Sie die Chance, sich in einem internationalen Umfeld zu profilieren.";
    "抓住在这个多元且国际化的商业环境中脱颖而出的机会。" = "Nutzen Sie die Chance, sich in einem internationalen Umfeld zu profilieren.";
    "课程费用" = "Kursgebühr";
    "时长：3个月 (20次精品课)" = "Dauer: 3 Monate (20 Sitzungen)";
    "报名咨询 / 立即加入" = "Anfrage / Jetzt beitreten";
    "成长型" = "Wachstumsorientiertes"
}
Write-LangFile -LangCode "de" -LangName "Deutsch" -Map $deMap -OutFile "index-de.html"

# 4. Chinese
$zhMap = @{}
Write-LangFile -LangCode "zh-SG" -LangName "中文 (Chinese)" -Map $zhMap -OutFile "index-zh.html"
