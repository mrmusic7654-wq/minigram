import 'package:flutter/material.dart';

class Contact {
  final String id;
  final String name;
  final String phone;
  final String avatar;
  final bool isOnline;

  const Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    this.isOnline = false,
  });
}

class ContactsProvider with ChangeNotifier {
  final List<Contact> _contacts = [];
  final List<String> _selectedContacts = [];

  List<Contact> get contacts => _contacts;
  List<String> get selectedContacts => _selectedContacts;

  Future<void> loadContacts() async {
    await Future.delayed(const Duration(seconds: 1));
    
    _contacts.addAll([
      Contact(
        id: '1',
        name: 'John Smith',
        phone: '+1 234 567 8901',
        avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
        isOnline: true,
      ),
      Contact(
        id: '2',
        name: 'Sarah Johnson',
        phone: '+1 234 567 8902',
        avatar: 'https://randomuser.me/api/portraits/women/2.jpg',
        isOnline: false,
      ),
      Contact(
        id: '3',
        name: 'Mike Wilson',
        phone: '+1 234 567 8903',
        avatar: 'https://randomuser.me/api/portraits/men/3.jpg',
        isOnline: true,
      ),
      Contact(
        id: '4',
        name: 'Emma Davis',
        phone: '+1 234 567 8904',
        avatar: 'https://randomuser.me/api/portraits/women/4.jpg',
        isOnline: false,
      ),
      Contact(
        id: '5',
        name: 'David Brown',
        phone: '+1 234 567 8905',
        avatar: 'https://randomuser.me/api/portraits/men/5.jpg',
        isOnline: true,
      ),
    ]);
    
    notifyListeners();
  }

  void toggleContactSelection(String contactId) {
    if (_selectedContacts.contains(contactId)) {
      _selectedContacts.remove(contactId);
    } else {
      _selectedContacts.add(contactId);
    }
    notifyListeners();
  }

  void clearSelection() {
    _selectedContacts.clear();
    notifyListeners();
  }

  List<Contact> searchContacts(String query) {
    if (query.isEmpty) return _contacts;
    
    return _contacts.where((contact) {
      return contact.name.toLowerCase().contains(query.toLowerCase()) ||
          contact.phone.contains(query);
    }).toList();
  }
}