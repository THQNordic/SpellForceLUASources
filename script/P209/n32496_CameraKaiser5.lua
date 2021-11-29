-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 717.500122 , 337.174255 , 27.551722 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(683.614,336.229,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 716.612549 , 329.160919 , 27.551722 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(683.614,336.229,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 708.711792 , 322.049011 , 27.551722 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(683.614,336.229,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 697.727173 , 320.894348 , 27.551722 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(683.614,336.229,13.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
