import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/components/progress_indicator.dart';
import 'package:summit_admin_app/components/text_spanner.dart';
import 'package:summit_admin_app/components/the_tick.dart';
import 'package:summit_admin_app/controller/attendee_controller.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/respository/workshop_repository.dart';

class WorkshopUserIDScreen extends ConsumerStatefulWidget {
  final String id;
  final String wsName;
  final Function() screenClosed;
  const WorkshopUserIDScreen({
    Key? key,
    required this.id,
    required this.wsName,
    required this.screenClosed,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WorkshopUserIDScreenState();
}

class _WorkshopUserIDScreenState extends ConsumerState<WorkshopUserIDScreen> {
  bool _isApproved = false;
  bool _marked = false;
  late bool isPresent = false;

  void _addAttendence(String id, String wsName) {
    ref.read(workshopRepositoryProvider).addWorkshopAttendence(wsName, id);
    setState(
      () {
        _marked = true;
        _isApproved = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Attendee attendee;
    return ref.watch(getAttendeeByIDProvider(widget.id)).when(
          data: (attende) {
            attendee = attende;
            return Scaffold(
              appBar: theAppBar(context),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      isPresent
                          ? "Attendee Already Marked"
                          : 'Scanning Successful!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: 125,
                      height: 125,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: isPresent
                            ? const TheTick()
                            : _isApproved
                                ? const TheTick()
                                : const Text("Not Approved"),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextSpanner(
                      title: "Name : ",
                      subtitile: attendee.name,
                    ),
                    TextSpanner(
                      title: "Ticket ID : ",
                      subtitile: attendee.iedcRegistrationNumber,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 287.10,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: _isApproved ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.70,
                            color: isPresent
                                ? Colors.grey
                                : _isApproved
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (isPresent) {
                            widget.screenClosed();
                            Navigator.of(context).pop();
                          }
                          if (!_isApproved) {
                            _addAttendence(
                                "${widget.id} ${attendee.name}", widget.wsName);
                          } else {
                            widget.screenClosed();
                            Navigator.of(context).pop();
                          }
                        },
                        child: Center(
                          child: Text(
                            isPresent
                                ? "Go to Scanner"
                                : _marked
                                    ? "Go to Scanner"
                                    : !_isApproved
                                        ? "Approve "
                                        : 'Go to Scanner',
                            style: TextStyle(
                              color: _isApproved ? Colors.black : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 287,
                      height: 60,
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 36,
                        right: 35,
                        bottom: 8,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          var nav = Navigator.of(context);
                          nav.pop();
                          nav.pop();
                        },
                        child: const Center(
                          child: Text(
                            'Go to Workshop',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Invalid ID",
                    style: TextStyle(
                      color: Colors.red[200],
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      child: Text(
                        "Retry",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget.screenClosed();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
          loading: () => const Loader(),
        );
  }

  AppBar theAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Add Attendence"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          widget.screenClosed();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
