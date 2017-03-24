%define debug_package %{nil}

Summary:    Script for system login/logout sounds
Name:       system-sounds-script
Version:    0.1.0
Release:    %mkrel 1
Url:        https://github.com/tarakbumba/%{name}
License:    GPLv2
Group:      System/X11
Source0:    %{url}/releases/download/v0.1.0/%{name}-%{version}.tar.xz
BuildArch:  noarch

Requires:   sound-theme-freedesktop
Requires:   lightdm

%description
Simple Bash Script to provide user defined system
login/logout sounds for MATE and LightDM

%prep
%autosetup

%build

%install
%make_build PREFIX=%{_prefix} SYSCONFDIR=%{_sysconfdir} DESTDIR=%{buildroot} install

%files
%config(noreplace) %{_sysconfdir}/lightdm/lightdm.conf.d/50-system-sounds.conf
%{_bindir}/system-sounds-script
%{_sysconfdir}/skel/system-sounds.conf

%changelog
* Sat Mar 25 2017 Atilla ÖNTAŞ <tarakbumba@gmail.com> 0.1.0-1
- Initial package



