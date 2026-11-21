import 'package:flutter/material.dart';

void main() {
  runApp(const SejureApp());
}

const navy = Color(0xFF112A46);
const blue = Color(0xFF245886);
const yellow = Color(0xFFF7C843);
const canvas = Color(0xFFF5F7F9);
const green = Color(0xFF1D6C58);

class SejureApp extends StatelessWidget {
  const SejureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SEJURE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: navy,
          primary: navy,
          secondary: yellow,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: canvas,
        useMaterial3: true,
        fontFamily: 'sans-serif',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.blueGrey.shade300, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.blueGrey.shade100),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.blueGrey.shade100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: blue, width: 1.5),
          ),
        ),
      ),
      home: const AuthGate(),
    );
  }
}

class Auction {
  const Auction({
    required this.id,
    required this.date,
    required this.time,
    required this.address,
    required this.city,
    required this.propertyType,
    required this.caseNumber,
    required this.price,
    required this.basePrice,
    required this.court,
    required this.image,
  });

  final int id;
  final DateTime date;
  final String time;
  final String address;
  final String city;
  final String propertyType;
  final String caseNumber;
  final int price;
  final int basePrice;
  final String court;
  final String image;
}

final auctions = [
  Auction(
    id: 1,
    date: DateTime(2025, 6, 18),
    time: '09:00',
    address: 'Carrera 13 # 85-24',
    city: 'Bogotá, D.C.',
    propertyType: 'Apartamento',
    caseNumber: '11001-31-03-012-2023-00184-00',
    price: 485000000,
    basePrice: 339500000,
    court: 'Juzgado 12 Civil del Circuito',
    image:
        'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&w=900&q=80',
  ),
  Auction(
    id: 2,
    date: DateTime(2025, 6, 21),
    time: '10:30',
    address: 'Calle 7 Sur # 42-18',
    city: 'Medellín, Antioquia',
    propertyType: 'Casa',
    caseNumber: '05001-31-03-008-2022-00312-00',
    price: 620000000,
    basePrice: 434000000,
    court: 'Juzgado 8 Civil del Circuito',
    image:
        'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=900&q=80',
  ),
  Auction(
    id: 3,
    date: DateTime(2025, 6, 26),
    time: '14:00',
    address: 'Avenida 6N # 28N-35',
    city: 'Cali, Valle del Cauca',
    propertyType: 'Local comercial',
    caseNumber: '76001-31-03-004-2024-00076-00',
    price: 310000000,
    basePrice: 217000000,
    court: 'Juzgado 4 Civil del Circuito',
    image:
        'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=900&q=80',
  ),
  Auction(
    id: 4,
    date: DateTime(2025, 7, 3),
    time: '08:30',
    address: 'Vía La Calera, Km 6',
    city: 'La Calera, Cundinamarca',
    propertyType: 'Lote',
    caseNumber: '25175-40-03-001-2023-00219-00',
    price: 790000000,
    basePrice: 553000000,
    court: 'Juzgado Promiscuo Municipal',
    image:
        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80',
  ),
];

String money(int value) {
  final text = value.toString();
  final output = StringBuffer();
  for (var i = 0; i < text.length; i++) {
    if (i > 0 && (text.length - i) % 3 == 0) output.write('.');
    output.write(text[i]);
  }
  return '\$${output.toString()}';
}

String shortMoney(int value) => '\$${(value / 1000000).round()} M';

const monthNames = [
  '',
  'ene',
  'feb',
  'mar',
  'abr',
  'may',
  'jun',
  'jul',
  'ago',
  'sep',
  'oct',
  'nov',
  'dic',
];

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  String? username;

  @override
  Widget build(BuildContext context) {
    if (username == null) {
      return LoginScreen(
        onLogin: (value) => setState(() => username = value),
      );
    }
    return MainShell(
      username: username!,
      onLogout: () => setState(() => username = null),
    );
  }
}

class Brand extends StatelessWidget {
  const Brand({super.key, this.light = false});

  final bool light;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(Icons.account_balance_rounded, color: navy, size: 23),
        ),
        const SizedBox(width: 11),
        Text(
          'SEJURE',
          style: TextStyle(
            color: light ? Colors.white : navy,
            fontSize: 21,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.4,
          ),
        ),
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onLogin});

  final ValueChanged<String> onLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController(text: 'maria.garcia');
  final passwordController = TextEditingController(text: 'sejure2025');
  bool obscure = true;
  String? error;

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    FocusScope.of(context).unfocus();
    if (userController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      setState(() => error = 'Ingresa tu usuario y contraseña.');
      return;
    }
    widget.onLogin(userController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 304,
                  padding: const EdgeInsets.fromLTRB(28, 55, 28, 32),
                  decoration: const BoxDecoration(
                    color: navy,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(28),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Brand(light: true),
                      Spacer(),
                      Text(
                        'REMATES JUDICIALES',
                        style: TextStyle(
                          color: yellow,
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Oportunidades con\ninformación clara.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 31,
                          height: 1.12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 30, 28, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Bienvenido',
                        style: TextStyle(
                          color: navy,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Ingresa a tu cuenta para continuar.',
                        style: TextStyle(
                          color: Colors.blueGrey.shade500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 26),
                      const FieldLabel('USUARIO'),
                      TextField(
                        controller: userController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_rounded),
                          hintText: 'Número de documento o correo',
                        ),
                      ),
                      const SizedBox(height: 18),
                      const FieldLabel('CONTRASEÑA'),
                      TextField(
                        controller: passwordController,
                        obscureText: obscure,
                        onSubmitted: (_) => login(),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => obscure = !obscure),
                            icon: Icon(
                              obscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                          hintText: 'Ingresa tu contraseña',
                        ),
                      ),
                      if (error != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          error!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Se enviaría un enlace de recuperación.',
                              ),
                            ),
                          ),
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 55,
                        child: FilledButton(
                          onPressed: login,
                          style: FilledButton.styleFrom(
                            backgroundColor: yellow,
                            foregroundColor: navy,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    required this.username,
    required this.onLogout,
  });

  final String username;
  final VoidCallback onLogout;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0;
  final Set<int> tracked = {1, 3};
  List<Auction>? filteredAuctions;

  void toggleTracked(int id) {
    setState(() {
      tracked.contains(id) ? tracked.remove(id) : tracked.add(id);
    });
  }

  void openDetail(Auction auction) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AuctionDetailScreen(
          auction: auction,
          initiallyTracked: tracked.contains(auction.id),
          onTrackingChanged: (value) {
            setState(() {
              value ? tracked.add(auction.id) : tracked.remove(auction.id);
            });
          },
        ),
      ),
    );
  }

  void showResults(List<Auction> results) {
    setState(() {
      filteredAuctions = results;
      currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        username: widget.username,
        trackedCount: tracked.length,
        tracked: tracked,
        onLogout: widget.onLogout,
        onNavigate: (index) => setState(() => currentIndex = index),
        onToggle: toggleTracked,
        onOpen: openDetail,
      ),
      SearchScreen(
        items: filteredAuctions ?? auctions,
        isFiltered: filteredAuctions != null,
        tracked: tracked,
        onClearFilters: () => setState(() => filteredAuctions = null),
        onOpenFilters: () => setState(() => currentIndex = 2),
        onToggle: toggleTracked,
        onOpen: openDetail,
      ),
      FilterScreen(onApply: showResults),
      TrackingScreen(
        tracked: tracked,
        onToggle: toggleTracked,
        onOpen: openDetail,
        onExplore: () => setState(() => currentIndex = 1),
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        height: 72,
        selectedIndex: currentIndex,
        indicatorColor: yellow.withOpacity(.35),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) => setState(() {
          currentIndex = index;
          if (index != 1) filteredAuctions = null;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: 'Consulta',
          ),
          NavigationDestination(
            icon: Icon(Icons.tune_rounded),
            label: 'Filtros',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border_rounded),
            selectedIcon: Icon(Icons.bookmark_rounded),
            label: 'Seguimiento',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.username,
    required this.trackedCount,
    required this.tracked,
    required this.onLogout,
    required this.onNavigate,
    required this.onToggle,
    required this.onOpen,
  });

  final String username;
  final int trackedCount;
  final Set<int> tracked;
  final VoidCallback onLogout;
  final ValueChanged<int> onNavigate;
  final ValueChanged<int> onToggle;
  final ValueChanged<Auction> onOpen;

  @override
  Widget build(BuildContext context) {
    final firstName = username.split(RegExp(r'[._\s@]')).first;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.paddingOf(context).top + 16,
              20,
              30,
            ),
            color: navy,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Brand(light: true),
                    const Spacer(),
                    HeaderIconButton(
                      icon: Icons.notifications_none_rounded,
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    HeaderIconButton(
                      icon: Icons.logout_rounded,
                      onTap: onLogout,
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                Text(
                  'Hola, ${firstName[0].toUpperCase()}${firstName.substring(1)}',
                  style: TextStyle(color: Colors.white.withOpacity(.65)),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Encuentra tu próxima\noportunidad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    height: 1.12,
                  ),
                ),
                const SizedBox(height: 22),
                InkWell(
                  onTap: () => onNavigate(1),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.blueGrey.shade300),
                        const SizedBox(width: 12),
                        Text(
                          'Buscar por ubicación o expediente',
                          style: TextStyle(
                            color: Colors.blueGrey.shade300,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Row(
                children: [
                  Expanded(
                    child: QuickAction(
                      icon: Icons.tune_rounded,
                      title: 'Filtrar remates',
                      subtitle: 'Personaliza tu búsqueda',
                      color: blue,
                      onTap: () => onNavigate(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: QuickAction(
                      icon: Icons.bookmark_border_rounded,
                      title: '$trackedCount en seguimiento',
                      subtitle: 'Revisa tus guardados',
                      color: const Color(0xFFB78400),
                      onTap: () => onNavigate(3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Próximos remates',
                        style: TextStyle(
                          color: navy,
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Oportunidades destacadas',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => onNavigate(1),
                    child: const Text(
                      'Ver todos',
                      style: TextStyle(
                        color: blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...auctions.take(2).map(
                    (auction) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AuctionCard(
                        auction: auction,
                        tracked: tracked.contains(auction.id),
                        onToggle: () => onToggle(auction.id),
                        onOpen: () => onOpen(auction),
                      ),
                    ),
                  ),
            ]),
          ),
        ),
      ],
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.items,
    required this.isFiltered,
    required this.tracked,
    required this.onClearFilters,
    required this.onOpenFilters,
    required this.onToggle,
    required this.onOpen,
  });

  final List<Auction> items;
  final bool isFiltered;
  final Set<int> tracked;
  final VoidCallback onClearFilters;
  final VoidCallback onOpenFilters;
  final ValueChanged<int> onToggle;
  final ValueChanged<Auction> onOpen;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = searchController.text.toLowerCase();
    final results = widget.items.where((item) {
      return '${item.address} ${item.city} ${item.caseNumber} ${item.propertyType} ${item.court}'
          .toLowerCase()
          .contains(query);
    }).toList();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.isFiltered ? 'Resultados' : 'Consulta',
                        style: const TextStyle(
                          color: navy,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        widget.isFiltered
                            ? '${widget.items.length} coincidencias'
                            : 'Remates judiciales disponibles',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.isFiltered)
                  TextButton(
                    onPressed: widget.onClearFilters,
                    child: const Text('Ver todos'),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Dirección, expediente...',
                      suffixIcon: searchController.text.isEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                searchController.clear();
                                setState(() {});
                              },
                              icon: const Icon(Icons.close),
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton.filled(
                  onPressed: widget.onOpenFilters,
                  style: IconButton.styleFrom(
                    backgroundColor: navy,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(52, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.tune_rounded),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Text(
              '${results.length} resultados encontrados',
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? const EmptyState(
                    icon: Icons.search_off_rounded,
                    title: 'Sin resultados',
                    text: 'Intenta buscar con otros términos.',
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 28),
                    itemCount: results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (_, index) {
                      final auction = results[index];
                      return AuctionCard(
                        auction: auction,
                        tracked: widget.tracked.contains(auction.id),
                        compact: true,
                        onToggle: () => widget.onToggle(auction.id),
                        onOpen: () => widget.onOpen(auction),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.onApply});

  final ValueChanged<List<Auction>> onApply;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  DateTime? date;
  TimeOfDay? time;
  String propertyType = '';
  final address = TextEditingController();
  final caseNumber = TextEditingController();
  final minPrice = TextEditingController();
  final minBase = TextEditingController();
  final court = TextEditingController();

  @override
  void dispose() {
    for (final controller in [
      address,
      caseNumber,
      minPrice,
      minBase,
      court,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  void clear() {
    setState(() {
      date = null;
      time = null;
      propertyType = '';
      address.clear();
      caseNumber.clear();
      minPrice.clear();
      minBase.clear();
      court.clear();
    });
  }

  int parseNumber(TextEditingController controller) =>
      int.tryParse(controller.text.replaceAll(RegExp(r'\D'), '')) ?? 0;

  void applyFilters() {
    final lowerAddress = address.text.toLowerCase();
    final lowerCase = caseNumber.text.toLowerCase();
    final lowerCourt = court.text.toLowerCase();
    final minimumPrice = parseNumber(minPrice);
    final minimumBase = parseNumber(minBase);
    final results = auctions.where((item) {
      final sameDate = date == null ||
          (item.date.year == date!.year &&
              item.date.month == date!.month &&
              item.date.day == date!.day);
      final formattedTime = time == null
          ? ''
          : '${time!.hour.toString().padLeft(2, '0')}:${time!.minute.toString().padLeft(2, '0')}';
      return sameDate &&
          (time == null || item.time == formattedTime) &&
          ('${item.address} ${item.city}'
              .toLowerCase()
              .contains(lowerAddress)) &&
          (propertyType.isEmpty || item.propertyType == propertyType) &&
          item.caseNumber.toLowerCase().contains(lowerCase) &&
          item.price >= minimumPrice &&
          item.basePrice >= minimumBase &&
          item.court.toLowerCase().contains(lowerCourt);
    }).toList();
    widget.onApply(results);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Filtros',
                      style: TextStyle(
                        color: navy,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Afina los resultados de tu consulta',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: clear,
                child: const Text(
                  'Limpiar',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: PickerField(
                  label: 'FECHA',
                  value: date == null
                      ? 'Seleccionar'
                      : '${date!.day}/${date!.month}/${date!.year}',
                  icon: Icons.calendar_today_outlined,
                  onTap: () async {
                    final result = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2030),
                      initialDate: date ?? DateTime(2025, 6, 18),
                    );
                    if (result != null) setState(() => date = result);
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PickerField(
                  label: 'HORA',
                  value: time == null ? 'Seleccionar' : time!.format(context),
                  icon: Icons.schedule_rounded,
                  onTap: () async {
                    final result = await showTimePicker(
                      context: context,
                      initialTime: time ?? const TimeOfDay(hour: 9, minute: 0),
                    );
                    if (result != null) setState(() => time = result);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const FieldLabel('DIRECCIÓN'),
          TextField(
            controller: address,
            decoration: const InputDecoration(
              hintText: 'Ciudad, barrio o dirección',
            ),
          ),
          const SizedBox(height: 16),
          const FieldLabel('TIPO DE PREDIO'),
          DropdownButtonFormField<String>(
            value: propertyType,
            decoration: const InputDecoration(),
            items: const [
              DropdownMenuItem(value: '', child: Text('Todos los tipos')),
              DropdownMenuItem(
                value: 'Apartamento',
                child: Text('Apartamento'),
              ),
              DropdownMenuItem(value: 'Casa', child: Text('Casa')),
              DropdownMenuItem(
                value: 'Local comercial',
                child: Text('Local comercial'),
              ),
              DropdownMenuItem(value: 'Lote', child: Text('Lote')),
            ],
            onChanged: (value) => setState(() => propertyType = value ?? ''),
          ),
          const SizedBox(height: 16),
          const FieldLabel('NÚMERO DE EXPEDIENTE'),
          TextField(
            controller: caseNumber,
            decoration: const InputDecoration(
              hintText: 'Ej. 11001-31-03...',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel('PRECIO DESDE'),
                    TextField(
                      controller: minPrice,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: '\$ 0'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldLabel('BASE DESDE'),
                    TextField(
                      controller: minBase,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: '\$ 0'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const FieldLabel('JUZGADO'),
          TextField(
            controller: court,
            decoration: const InputDecoration(hintText: 'Nombre del juzgado'),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 55,
            child: FilledButton.icon(
              onPressed: applyFilters,
              style: FilledButton.styleFrom(
                backgroundColor: yellow,
                foregroundColor: navy,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.search_rounded),
              label: const Text(
                'Ver resultados',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({
    super.key,
    required this.tracked,
    required this.onToggle,
    required this.onOpen,
    required this.onExplore,
  });

  final Set<int> tracked;
  final ValueChanged<int> onToggle;
  final ValueChanged<Auction> onOpen;
  final VoidCallback onExplore;

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final searchController = TextEditingController();
  String selectedType = 'Todos';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saved = auctions
        .where((item) => widget.tracked.contains(item.id))
        .toList();
    final types = {'Todos', ...saved.map((item) => item.propertyType)}.toList();
    if (!types.contains(selectedType)) selectedType = 'Todos';
    final query = searchController.text.toLowerCase();
    final results = saved.where((item) {
      final matchesType =
          selectedType == 'Todos' || item.propertyType == selectedType;
      return matchesType &&
          '${item.address} ${item.city} ${item.caseNumber}'
              .toLowerCase()
              .contains(query);
    }).toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seguimiento',
                  style: TextStyle(
                    color: navy,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '${saved.length} remates guardados',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: 'Buscar en seguimiento',
              ),
            ),
          ),
          if (types.length > 1)
            SizedBox(
              height: 64,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: types.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  final type = types[index];
                  return ChoiceChip(
                    label: Text(type),
                    selected: selectedType == type,
                    onSelected: (_) => setState(() => selectedType = type),
                    selectedColor: navy,
                    labelStyle: TextStyle(
                      color: selectedType == type ? Colors.white : Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    showCheckmark: false,
                  );
                },
              ),
            ),
          Expanded(
            child: results.isEmpty
                ? EmptyState(
                    icon: Icons.bookmark_border_rounded,
                    title: saved.isEmpty
                        ? 'Aún no tienes seguimientos'
                        : 'Sin coincidencias',
                    text: saved.isEmpty
                        ? 'Guarda un remate para consultar sus datos rápidamente.'
                        : 'Prueba con otra búsqueda o filtro.',
                    action: saved.isEmpty
                        ? FilledButton(
                            onPressed: widget.onExplore,
                            style: FilledButton.styleFrom(
                              backgroundColor: yellow,
                              foregroundColor: navy,
                            ),
                            child: const Text(
                              'Explorar remates',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          )
                        : null,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 28),
                    itemCount: results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (_, index) {
                      final auction = results[index];
                      return AuctionCard(
                        auction: auction,
                        compact: true,
                        tracked: true,
                        onToggle: () {
                          widget.onToggle(auction.id);
                          setState(() {});
                        },
                        onOpen: () => widget.onOpen(auction),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class AuctionDetailScreen extends StatefulWidget {
  const AuctionDetailScreen({
    super.key,
    required this.auction,
    required this.initiallyTracked,
    required this.onTrackingChanged,
  });

  final Auction auction;
  final bool initiallyTracked;
  final ValueChanged<bool> onTrackingChanged;

  @override
  State<AuctionDetailScreen> createState() => _AuctionDetailScreenState();
}

class _AuctionDetailScreenState extends State<AuctionDetailScreen> {
  late bool tracked = widget.initiallyTracked;

  void toggle() {
    setState(() => tracked = !tracked);
    widget.onTrackingChanged(tracked);
  }

  @override
  Widget build(BuildContext context) {
    final auction = widget.auction;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 270,
            pinned: true,
            backgroundColor: navy,
            foregroundColor: navy,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: tracked ? yellow : Colors.white,
                  child: IconButton(
                    onPressed: toggle,
                    icon: Icon(
                      tracked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: NetworkImageBox(
                url: auction.image,
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 35),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'REMATE JUDICIAL',
                  style: TextStyle(
                    color: Color(0xFFB78400),
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  auction.address,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  auction.city,
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: PriceBox(
                        label: 'AVALÚO',
                        value: money(auction.price),
                        color: navy,
                        background: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PriceBox(
                        label: 'BASE DEL REMATE',
                        value: money(auction.basePrice),
                        color: green,
                        background: const Color(0xFFEAF4EF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text(
                  'Información del remate',
                  style: TextStyle(
                    color: navy,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      DetailRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'FECHA',
                        value:
                            '${auction.date.day} de ${monthNames[auction.date.month]} de ${auction.date.year}',
                      ),
                      DetailRow(
                        icon: Icons.schedule_rounded,
                        label: 'HORA',
                        value: auction.time,
                      ),
                      DetailRow(
                        icon: Icons.location_on_outlined,
                        label: 'DIRECCIÓN',
                        value: '${auction.address}, ${auction.city}',
                      ),
                      DetailRow(
                        icon: Icons.apartment_rounded,
                        label: 'TIPO DE PREDIO',
                        value: auction.propertyType,
                      ),
                      DetailRow(
                        icon: Icons.folder_outlined,
                        label: 'EXPEDIENTE',
                        value: auction.caseNumber,
                      ),
                      DetailRow(
                        icon: Icons.account_balance_outlined,
                        label: 'JUZGADO',
                        value: auction.court,
                        last: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 55,
                  child: tracked
                      ? OutlinedButton.icon(
                          onPressed: toggle,
                          icon: const Icon(Icons.check_rounded),
                          label: const Text('En seguimiento'),
                        )
                      : FilledButton.icon(
                          onPressed: toggle,
                          style: FilledButton.styleFrom(
                            backgroundColor: yellow,
                            foregroundColor: navy,
                          ),
                          icon: const Icon(Icons.bookmark_border_rounded),
                          label: const Text(
                            'Agregar a seguimiento',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class AuctionCard extends StatelessWidget {
  const AuctionCard({
    super.key,
    required this.auction,
    required this.tracked,
    required this.onToggle,
    required this.onOpen,
    this.compact = false,
  });

  final Auction auction;
  final bool tracked;
  final VoidCallback onToggle;
  final VoidCallback onOpen;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      shadowColor: navy.withOpacity(.12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: compact ? 120 : 148,
            child: Stack(
              fit: StackFit.expand,
              children: [
                NetworkImageBox(
                  url: auction.image,
                  borderRadius: BorderRadius.zero,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xAA112A46)],
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Tag(label: auction.propertyType),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: InkWell(
                    onTap: onToggle,
                    borderRadius: BorderRadius.circular(30),
                    child: CircleAvatar(
                      radius: 19,
                      backgroundColor: tracked ? yellow : Colors.white,
                      foregroundColor: navy,
                      child: Icon(
                        tracked
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          '${auction.date.day} ${monthNames[auction.date.month]}',
                          style: const TextStyle(
                            color: navy,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        auction.time,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onOpen,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              auction.address,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: navy,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 14,
                                  color: Colors.blueGrey,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    auction.city,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                  const Divider(height: 27),
                  Row(
                    children: [
                      PriceSummary(
                        label: 'AVALÚO',
                        value: shortMoney(auction.price),
                      ),
                      const Spacer(),
                      PriceSummary(
                        label: 'BASE DEL REMATE',
                        value: shortMoney(auction.basePrice),
                        color: green,
                        alignEnd: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkImageBox extends StatelessWidget {
  const NetworkImageBox({
    super.key,
    required this.url,
    required this.borderRadius,
  });

  final String url;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: const Color(0xFFDCE5EC),
          child: const Icon(
            Icons.apartment_rounded,
            size: 48,
            color: blue,
          ),
        ),
      ),
    );
  }
}

class QuickAction extends StatelessWidget {
  const QuickAction({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  color: color.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 21),
              ),
              const SizedBox(height: 13),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: navy,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderIconButton extends StatelessWidget {
  const HeaderIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(.1),
        foregroundColor: Colors.white,
      ),
      icon: Icon(icon, size: 20),
    );
  }
}

class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}

class PickerField extends StatelessWidget {
  const PickerField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label),
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 53,
              padding: const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.blueGrey, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: navy, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    super.key,
    required this.label,
    required this.value,
    this.color = navy,
    this.alignEnd = false,
  });

  final String label;
  final String value;
  final Color color;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class PriceBox extends StatelessWidget {
  const PriceBox({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    required this.background,
  });

  final String label;
  final String value;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color.withOpacity(.65),
              fontSize: 9,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.last = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: last
            ? null
            : Border(
                bottom: BorderSide(color: Colors.blueGrey.shade50),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: blue, size: 19),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .8,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: navy,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: navy,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
    this.action,
  });

  final IconData icon;
  final String title;
  final String text;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 29,
              backgroundColor: Colors.blueGrey.shade50,
              child: Icon(icon, color: Colors.blueGrey, size: 27),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: navy,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 12,
                height: 1.5,
              ),
            ),
            if (action != null) ...[const SizedBox(height: 18), action!],
          ],
        ),
      ),
    );
  }
}
