package com.list

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.ListViewManagerInterface
import com.facebook.react.viewmanagers.ListViewManagerDelegate

@ReactModule(name = ListViewManager.NAME)
class ListViewManager : SimpleViewManager<ListView>(),
  ListViewManagerInterface<ListView> {
  private val mDelegate: ViewManagerDelegate<ListView>

  init {
    mDelegate = ListViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<ListView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): ListView {
    return ListView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: ListView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "ListView"
  }
}
