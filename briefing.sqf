waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Changelog"];
player createDiarySubject ["serverrules","Regras do Servidor"];
player createDiarySubject ["policerules","Regras da Policia"];
player createDiarySubject ["safezones","SafeZones"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Ilegal"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controles"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					Todas as alterações são estão no Fórum: EM BREVE
				"
		]
	];

	player createDiaryRecord["changelog",
		[
			"OS DELICIAS Changelog",
				"
					Todas as alterações são estão no Fórum: EM BREVE
				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"Exploits",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE<br/>
				"
		]
	];

	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];


	player createDiaryRecord ["serverrules",
		[
			"Delitos",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Interação do Policias",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Barcos",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Aviação",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Veiculos",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Comunicação das regras",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching (RDM)",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Regra de Nova Vida",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Você não pode ser o PICA",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

// Police Section
	player createDiaryRecord ["policerules",
		[
			"Negociação de Crises",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"A Reserva Federal",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>licopters cannot hover over the city. Cops may only hover over the city if there is an active police operation going on.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Illegal Areas",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Patrolling",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Checkpoints",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Fahrzeuge",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Regras de Velocidade",
				"
				Nas capitais: 30<br/>
				Nas estradas principais: 120Km/h<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Trabalhos",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE! !<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Prisão e fiaças",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE!<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Armas legais",
				"
				Armas legais para civil (com licença de arma):<br/>
				1. P07<br/>
				3. ACP-C2<br/>
				5. PDW2000<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Uso de armas",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE! !<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"BOPE",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE! ! !<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Hieranquia",
				"
				Rangkette:<br/>
				1. Recruta<br/>
				2. Cabo<br/>
				3. Chefe de policia<br/>
				4. SEK<br/>
				5. GSG9<br/>
				6. SEK-M<br/>
				7. ADMINS<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Outras",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE! !<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Teamspeak Regeln",
				"
				1. Alle Polizisten müssen sich auf dem TeamSpeak befinden wärend sie als Polizist eingeloggt sind.<br/>
				2. Alles weitere unter HOMEPAGE_URL zu finden<br/><br/>
				"
		]
	];



// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Regras rebeldes",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE! !<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Regras de Gangue",
				"
				Todas as regras que você pode encontrar em nosso fórum! EM BREVE! !<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Veículos ilegais",
				"
				Com sinal de + são tudo ilegal o resto apenas em Kavala<br/><br/>

				1. Ifrit<br/>
				2. Speedboat<br/>
				3. Hunter<br/>
				4. Police Offroad+<br/>
				5. Ifrit-HMG+<br/>
				6. Hunter-HMG+<br/>
				7. Strider<br/>
				8. Hunter Policial+<br/>
				9. Helicoptero Policial+<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Armas ilegais",
				"
				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. Mk.20 Series<br/>
				5. Mk.18 EBR<br/>
				6. SDAR Rifle<br/>
				7. Sting SMG<br/>
				8. Silenced Rock40 (Tazer)<br/>
				9. Sprengstoff<br/>
				10. Zafir/Mk200<br/>
				11. M320 LRR<br/>
				12. Vermin ACP<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Mercadorias ilegais",
				"
				As seguintes matérias-primas são ilegais :<br/><br/>
				1. Turtles<br/>
				2. Cocaina<br/>
				3. Heroina<br/>
				4. Cannabis<br/>
				5. Marijuana<br/>
				6. Meth<br/>
				7. Moonshine<br/>
				8. Barra de outro<br/>
				9. Uranio III<br/>
				10. Rins<br/>
				"
		]
	];


// Controls Section

	player createDiaryRecord ["controls",
		[
			"Os delicias - Controle",
				"
				Z: Menu de jogadores<br/>
				U: Abrir e fechar veiculos<br/>
				U: Abrir e fechar casas<br/>
				F: Sirene da Policia<br/>
				T: Inventario virtual de veiculos e casas<br/>
				Ö: Alarme de Policia<br/>
				Ä: Barreira Policial öffnen<br/>
				O: Colocar e Tirar Cone - Policias<br/>
				^: Picareta<br/>
				Left Shift + 1: Telefone<br/>
				Left Shift + 2: Lista de Procurados<br/>
				Left Shift + 3: Acusações<br/>
				Left Shift + R: Algemar<br/>
				Left Shift + G: Se Render<br/>
				Left Shift + V: Nocaute<br/>
				Left Shift + O: Civ Restrain<br/>
				Left Shift + Space: Pular<br/>
				Left Shift + H: Colocar a arma no Coldre<br/>
				Left Windows: Opções da casa<br/>
				Left Windows: Farms aos campos<br/>
				Left Windows: Menu de interação de jogadores<br/>
				"
		]
	];