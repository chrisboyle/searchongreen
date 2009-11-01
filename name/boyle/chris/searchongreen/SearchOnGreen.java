/*
Search on green - trivial hack to connect long-press of the green
button to the new Voice Search in Android 1.6.
Copyright (C) 2009 Chris Boyle

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

package name.boyle.chris.searchongreen;
import android.app.Activity;
import android.content.Intent;
import android.widget.Toast;

public class SearchOnGreen extends Activity
{
	public void onStart()
	{
		try {
			startActivity(new Intent().setClassName("com.google.android.voicesearch","com.google.android.voicesearch.RecognitionActivity"));
		} catch (Exception e) {
			Toast.makeText(this, "Could not launch Voice Search, perhaps you don't have it?\n\n("+e.getClass().getName()+")", Toast.LENGTH_LONG).show();
		}
		super.onStart();
		finish();
	}
}
