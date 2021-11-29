-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 315.568756 , 126.001900 , 21.386692 , 9.800001 , [[Camera:ScriptSplineLookAtNpc(5539);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 314.643494 , 126.381233 , 21.386692 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 313.718231 , 126.760567 , 21.386692 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 312.792969 , 127.139900 , 21.386692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
