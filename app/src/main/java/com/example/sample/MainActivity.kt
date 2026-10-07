package com.example.sample

import android.os.Build
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.sample.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private var tapCount = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupDeviceInfo()
        setupInteractions()
    }

    private fun setupDeviceInfo() {
        val manufacturer = Build.MANUFACTURER.replaceFirstChar { it.uppercase() }
        val model = Build.MODEL
        binding.tvDeviceModel.text = "$manufacturer $model"

        val release = Build.VERSION.RELEASE
        val sdkInt = Build.VERSION.SDK_INT
        binding.tvAndroidVersion.text = "Android $release (API $sdkInt)"

        val abi = if (Build.SUPPORTED_ABIS.isNotEmpty()) {
            Build.SUPPORTED_ABIS[0]
        } else {
            "Unknown"
        }
        binding.tvArchitecture.text = abi
    }

    private fun setupInteractions() {
        updateCounterText()

        binding.btnIncrement.setOnClickListener {
            tapCount++
            updateCounterText()
        }

        binding.btnToast.setOnClickListener {
            Toast.makeText(
                this,
                getString(R.string.toast_message),
                Toast.LENGTH_SHORT
            ).show()
        }
    }

    private fun updateCounterText() {
        binding.tvCounterDisplay.text = getString(R.string.counter_text, tapCount)
    }
}
