import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:skportfolio/screen/contact_screen.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> imageUrls;
  final Color color;
  final Color buttonColor;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.imageUrls,
    required this.color,
    required this.buttonColor,
  });
}

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<Project> projects = [
    Project(
      title: 'E-commerce App',
      description: 'A full-featured online shopping experience',
      imageUrl: 'assets/e1.png',
      imageUrls: ['assets/e1.jpg', 'assets/e2.jpg', 'assets/e3.jpg', 'assets/e4.jpg', 'assets/e5.jpg', 'assets/e6.jpg'],
      color: Color.fromRGBO(49, 48, 48, 1.0),
      buttonColor: Colors.black,
    ),
    Project(
      title: 'Hotel Booking App',
      description: 'Discover and share delicious room book',
      imageUrl: 'assets/f4.jpg',
      imageUrls: ['assets/f4.jpg', 'assets/f5.jpg'],
      color: Colors.teal.shade50,
      buttonColor: Colors.teal,
    ),
    Project(
      title: 'Digital Course App',
      description: 'A full-featured online course experience',
      imageUrl: 'assets/f7.jpg',
      imageUrls: ['assets/f6.jpg', 'assets/f7.jpg'],
      color: Colors.blueAccent.shade100,
      buttonColor: Colors.blueAccent,
    ),
    Project(
      title: 'Todo Tracker App',
      description: 'This app helps to track your daily work',
      imageUrl: 'assets/todo1.png',
      imageUrls: ['assets/t1.jpg', 'assets/t2.jpg', 'assets/t3.jpg', 'assets/t4.jpg'],
      color: Colors.green.shade50,
      buttonColor: Colors.green,
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Monitor your health and fitness goals',
      imageUrl: 'assets/f1.jpg',
      imageUrls: ['assets/f1.jpg', 'assets/f2.jpg', 'assets/f3.jpg'],
      color: Colors.blue.shade50,
      buttonColor: Colors.blue,
    ),

  ];

  late FixedExtentScrollController _scrollController;
  bool _showDialog = false;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        setState(() {
          _showDialog = true;
        });
        _showAnimatedDialog(context);
      }
    }
  }

  void _showAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Allows dismissing by tapping outside
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withOpacity(0.5), // Dim background
      transitionDuration: Duration(milliseconds: 300), // Duration of animation
      pageBuilder: (context, anim1, anim2) {
        return SizedBox.shrink(); // Empty widget, as pageBuilder is mandatory
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.7, end: 1.0).animate(CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOutBack,
          )),
          child: Opacity(
            opacity: anim1.value,
            child: Center(
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.teal, width: 2),
                ),
                title: Text(
                  'Let\'s create something amazing!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),
                content: Text(
                  'I will create any kind of app with dedication and skill, '
                      'bringing ideas to life through thoughtful design and '
                      'efficient coding. Please contact me',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Contact Me',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage(),));
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('OK',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight - 20,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListWheelScrollView(
                    controller: _scrollController,
                    itemExtent: 290,
                    diameterRatio: 2.0,
                    offAxisFraction: -0.5,
                    physics: FixedExtentScrollPhysics(),
                    children: projects.asMap().entries.map((entry) {
                      int idx = entry.key;
                      Project project = entry.value;
                      return AnimationConfiguration.staggeredList(
                        position: idx,
                        duration: const Duration(milliseconds: 200),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: ProjectCard(project: project),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width <= 600;
    final double imageHeight = isSmallScreen ? 110 : 170;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          transform: _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_isHovered ? widget.project.color.withOpacity(0.9) : Colors.white, widget.project.color.withOpacity(0.6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              width: 0.5,
              color: widget.project.buttonColor,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? widget.project.color.withOpacity(0.4) : Colors.black.withOpacity(0.1),
                spreadRadius: _isHovered ? 5 : 0,
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      widget.project.imageUrl,
                      height: imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: widget.project.buttonColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                      ),
                      child: Text(
                        widget.project.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 12 : 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.project.description,
                        style: TextStyle(fontSize: isSmallScreen ? 12 : 14, color: Colors.grey[700]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isSmallScreen ? 5 : 10),
                      ElevatedButton(
                        onPressed: () {
                          _showImageDialog(context, widget.project.imageUrls);
                        },
                        child: Text('View', style: TextStyle(fontSize: isSmallScreen ? 12 : 14, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16, vertical: isSmallScreen ? 8 : 10),
                          backgroundColor: widget.project.buttonColor,
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
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  void _showImageDialog(BuildContext context, List<String> imageUrls) {
    final screenSize = MediaQuery.of(context).size;
    final double dialogWidth = screenSize.width > 600 ? 500 : screenSize.width - 40;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: dialogWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Images',
                        style: TextStyle(
                          fontSize: screenSize.width > 600 ? 24 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: imageUrls.map((url) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Image.asset(
                                  url,
                                  width: screenSize.width > 600 ? 150 : 200,
                                  height: MediaQuery.of(context).size.height * 0.50,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close, color: widget.project.buttonColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}