-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 298.575043 , 443.127350 , 13.453230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(292.176,446.274,12.700);]] )
   Camera:MotionSpline_AddSplinePoint( 298.575043 , 443.127350 , 13.453230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(292.176,446.274,12.700);]] )
   Camera:MotionSpline_AddSplinePoint( 298.575043 , 443.127350 , 13.453230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(292.176,446.274,12.700);]] )
   Camera:MotionSpline_AddSplinePoint( 298.575043 , 443.127350 , 13.453230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(292.176,446.274,12.700);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
