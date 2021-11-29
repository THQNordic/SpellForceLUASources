-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 294.070221 , 84.360718 , 32.136150 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(284.955,92.493,32.000);]] )
   Camera:MotionSpline_AddSplinePoint( 295.339020 , 82.495247 , 32.136150 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 296.247986 , 80.318344 , 32.136150 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 296.874237 , 78.766495 , 32.136150 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
